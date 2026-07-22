import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/deep_link/pending_invite_storage.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/invite/cubit/invite_cubit.dart';

class _MockOrganizationRepository extends Mock
    implements OrganizationRepository {}

class _MockPendingInviteStorage extends Mock implements PendingInviteStorage {}

class _MockAuthStateNotifier extends Mock implements AuthStateNotifier {}

void main() {
  late _MockOrganizationRepository organizationRepository;
  late _MockPendingInviteStorage pendingInviteStorage;
  late _MockAuthStateNotifier authNotifier;

  const code = 'ABC12345';

  setUp(() {
    organizationRepository = _MockOrganizationRepository();
    pendingInviteStorage = _MockPendingInviteStorage();
    authNotifier = _MockAuthStateNotifier();

    when(() => pendingInviteStorage.save(any())).thenAnswer((_) async {});
  });

  InviteCubit buildCubit() => InviteCubit(
    code: code,
    organizationRepository: organizationRepository,
    pendingInviteStorage: pendingInviteStorage,
    authNotifier: authNotifier,
  );

  group('InviteCubit — авторизован', () {
    setUp(() {
      when(() => authNotifier.isAuthenticated).thenReturn(true);
    });

    test('успех → InviteState.success с названием организации', () async {
      when(() => organizationRepository.join(code)).thenAnswer(
        (_) async => const Task.success(
          JoinResult(
            organizationId: 'org-1',
            organizationName: 'Кофейня на Ленина',
            role: 'employee',
          ),
        ),
      );

      final cubit = buildCubit();
      await Future<void>.delayed(Duration.zero);

      expect(
        cubit.state,
        const InviteState.success(organizationName: 'Кофейня на Ленина'),
      );
      await cubit.close();
    });

    test('INVALID_INVITE (404) → error(kind: invalidInvite)', () async {
      when(() => organizationRepository.join(code)).thenAnswer(
        (_) async => const Task.failure(
          ApiException.server(message: 'not found', code: 'INVALID_INVITE'),
        ),
      );

      final cubit = buildCubit();
      await Future<void>.delayed(Duration.zero);

      expect(
        cubit.state,
        const InviteState.error(
          kind: InviteErrorKind.invalidInvite,
          message: 'not found',
        ),
      );
      await cubit.close();
    });

    test('OWNER_CANNOT_JOIN (400) → error(kind: ownerCannotJoin)', () async {
      when(() => organizationRepository.join(code)).thenAnswer(
        (_) async => const Task.failure(
          ApiException.server(message: 'owner', code: 'OWNER_CANNOT_JOIN'),
        ),
      );

      final cubit = buildCubit();
      await Future<void>.delayed(Duration.zero);

      expect(
        cubit.state.mapOrNull(error: (s) => s.kind),
        InviteErrorKind.ownerCannotJoin,
      );
      await cubit.close();
    });

    test('ALREADY_MEMBER (409) → error(kind: alreadyMember)', () async {
      when(() => organizationRepository.join(code)).thenAnswer(
        (_) async => const Task.failure(
          ApiException.server(message: 'already', code: 'ALREADY_MEMBER'),
        ),
      );

      final cubit = buildCubit();
      await Future<void>.delayed(Duration.zero);

      expect(
        cubit.state.mapOrNull(error: (s) => s.kind),
        InviteErrorKind.alreadyMember,
      );
      await cubit.close();
    });

    test(
      'неизвестный/сетевой код → error(kind: network), retry() пробует снова',
      () async {
        when(() => organizationRepository.join(code)).thenAnswer(
          (_) async => const Task.failure(
            ApiException.network(message: 'no connection'),
          ),
        );

        final cubit = buildCubit();
        await Future<void>.delayed(Duration.zero);

        expect(
          cubit.state.mapOrNull(error: (s) => s.kind),
          InviteErrorKind.network,
        );

        when(() => organizationRepository.join(code)).thenAnswer(
          (_) async => const Task.success(
            JoinResult(
              organizationId: 'org-1',
              organizationName: 'Кофейня',
              role: 'employee',
            ),
          ),
        );
        await cubit.retry();

        expect(
          cubit.state,
          const InviteState.success(organizationName: 'Кофейня'),
        );
        verify(() => organizationRepository.join(code)).called(2);
        await cubit.close();
      },
    );
  });

  group('InviteCubit — не авторизован', () {
    test('сохраняет код в PendingInviteStorage и переводит в requiresAuth, '
        'НЕ вызывая join', () async {
      when(() => authNotifier.isAuthenticated).thenReturn(false);

      final cubit = buildCubit();
      await Future<void>.delayed(Duration.zero);

      expect(cubit.state, const InviteState.requiresAuth());
      verify(() => pendingInviteStorage.save(code)).called(1);
      verifyNever(() => organizationRepository.join(any()));
      await cubit.close();
    });
  });
}
