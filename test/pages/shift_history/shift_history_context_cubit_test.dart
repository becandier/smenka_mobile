import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/data/api/local/shift_history_context_storage.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_history_context_cubit.dart';

class _MockOrganizationRepository extends Mock
    implements OrganizationRepository {}

class _MockShiftHistoryContextStorage extends Mock
    implements ShiftHistoryContextStorage {}

Organization _org(
  String id,
  String name, {
  OrgMembershipRole myRole = OrgMembershipRole.employee,
}) => Organization(
  id: id,
  name: name,
  ownerId: 'owner1',
  inviteCode: 'INV12345',
  isDeleted: false,
  createdAt: DateTime.utc(2026),
  myRole: myRole,
);

void main() {
  late _MockOrganizationRepository orgRepo;
  late _MockShiftHistoryContextStorage storage;
  late StreamController<List<Organization>> orgController;

  setUp(() {
    orgRepo = _MockOrganizationRepository();
    storage = _MockShiftHistoryContextStorage();
    orgController = StreamController<List<Organization>>.broadcast();

    when(
      () => orgRepo.watchMyOrganizations(),
    ).thenAnswer((_) => orgController.stream);
    when(() => orgRepo.fetchMyOrganizations()).thenAnswer((_) async {});
    when(() => storage.save(any())).thenAnswer((_) async {});
  });

  tearDown(() => orgController.close());

  ShiftHistoryContextCubit buildCubit({String? savedMarker}) {
    when(() => storage.read()).thenReturn(savedMarker);
    return ShiftHistoryContextCubit(
      organizationRepository: orgRepo,
      contextStorage: storage,
    );
  }

  group('дефолт без сохранённого выбора (правило 2/3)', () {
    test('организаций ≥ 1 → первая доступная, isLoading снимается только '
        'после загрузки', () async {
      final cubit = buildCubit();

      expect(cubit.state.isLoading, isTrue);
      expect(cubit.state.scope, isNull);

      orgController.add([_org('org1', 'Org 1'), _org('org2', 'Org 2')]);
      await pumpEventQueue();

      expect(cubit.state.isLoading, isFalse);
      expect(cubit.state.scope, ShiftScope.organization);
      expect(cubit.state.organizationId, 'org1');
      await cubit.close();
    });

    test('организаций нет → без ограничения, scope не передаётся, селектор '
        'скрыт', () async {
      final cubit = buildCubit();

      orgController.add(const []);
      await pumpEventQueue();

      expect(cubit.state.isLoading, isFalse);
      expect(cubit.state.scope, isNull);
      expect(cubit.state.organizationId, isNull);
      expect(cubit.state.hasOrganizations, isFalse);
      await cubit.close();
    });

    test(
      'owner-only организация исключена (ADR-001) → как «организаций нет»',
      () async {
        final cubit = buildCubit();

        orgController.add([
          _org('org1', 'Org 1', myRole: OrgMembershipRole.owner),
        ]);
        await pumpEventQueue();

        expect(cubit.state.isLoading, isFalse);
        expect(cubit.state.scope, isNull);
        expect(cubit.state.hasOrganizations, isFalse);
        await cubit.close();
      },
    );
  });

  group(
    'сохранённый выбор — применяется сразу (eager), до загрузки организаций',
    () {
      test(
        'org id — резолвится синхронно, до первого события стрима',
        () async {
          final cubit = buildCubit(savedMarker: 'org2');

          expect(cubit.state.isLoading, isFalse);
          expect(cubit.state.scope, ShiftScope.organization);
          expect(cubit.state.organizationId, 'org2');
          await cubit.close();
        },
      );

      test('personal-маркер — восстанавливается', () async {
        final cubit = buildCubit(savedMarker: ShiftScope.personal.value);

        expect(cubit.state.isLoading, isFalse);
        expect(cubit.state.scope, ShiftScope.personal);
        expect(cubit.state.organizationId, isNull);
        await cubit.close();
      });

      test('all-маркер — восстанавливается', () async {
        final cubit = buildCubit(savedMarker: ShiftScope.all.value);

        expect(cubit.state.isLoading, isFalse);
        expect(cubit.state.scope, ShiftScope.all);
        expect(cubit.state.organizationId, isNull);
        await cubit.close();
      });
    },
  );

  group('перепроверка валидности после загрузки организаций', () {
    test(
      'сохранённая организация есть среди доступных → остаётся как есть',
      () async {
        final cubit = buildCubit(savedMarker: 'org2');

        orgController.add([_org('org1', 'Org 1'), _org('org2', 'Org 2')]);
        await pumpEventQueue();

        expect(cubit.state.scope, ShiftScope.organization);
        expect(cubit.state.organizationId, 'org2');
        await cubit.close();
      },
    );

    test(
      'сохранённая организация пропала из доступных → молча первая доступная',
      () async {
        final cubit = buildCubit(savedMarker: 'org-deleted');

        orgController.add([_org('org1', 'Org 1'), _org('org2', 'Org 2')]);
        await pumpEventQueue();

        expect(cubit.state.scope, ShiftScope.organization);
        expect(cubit.state.organizationId, 'org1');
        await cubit.close();
      },
    );

    test('сохранённая организация пропала и доступных больше нет → без '
        'ограничения, без ошибки', () async {
      final cubit = buildCubit(savedMarker: 'org-deleted');

      orgController.add(const []);
      await pumpEventQueue();

      expect(cubit.state.scope, isNull);
      expect(cubit.state.organizationId, isNull);
      expect(cubit.state.hasOrganizations, isFalse);
      await cubit.close();
    });

    test('personal/all остаются валидны, пока есть хоть одна доступная '
        'организация', () async {
      final cubit = buildCubit(savedMarker: ShiftScope.personal.value);

      orgController.add([_org('org1', 'Org 1')]);
      await pumpEventQueue();

      expect(cubit.state.scope, ShiftScope.personal);
      await cubit.close();
    });

    test(
      'personal/all сбрасываются в null, если организаций не осталось вовсе',
      () async {
        final cubit = buildCubit(savedMarker: ShiftScope.all.value);

        orgController.add(const []);
        await pumpEventQueue();

        expect(cubit.state.scope, isNull);
        await cubit.close();
      },
    );
  });

  group('осознанный выбор в селекторе — запоминается', () {
    test('selectOrganization сохраняет UUID организации', () async {
      final cubit = buildCubit();
      orgController.add([_org('org1', 'Org 1'), _org('org2', 'Org 2')]);
      await pumpEventQueue();

      cubit.selectOrganization('org2');

      expect(cubit.state.scope, ShiftScope.organization);
      expect(cubit.state.organizationId, 'org2');
      verify(() => storage.save('org2')).called(1);
      await cubit.close();
    });

    test('selectPersonal сохраняет ShiftScope.personal.value', () async {
      final cubit = buildCubit();
      orgController.add([_org('org1', 'Org 1')]);
      await pumpEventQueue();

      cubit.selectPersonal();

      expect(cubit.state.scope, ShiftScope.personal);
      verify(() => storage.save(ShiftScope.personal.value)).called(1);
      await cubit.close();
    });

    test('selectAll сохраняет ShiftScope.all.value', () async {
      final cubit = buildCubit();
      orgController.add([_org('org1', 'Org 1')]);
      await pumpEventQueue();

      cubit.selectAll();

      expect(cubit.state.scope, ShiftScope.all);
      verify(() => storage.save(ShiftScope.all.value)).called(1);
      await cubit.close();
    });

    test(
      'повторный выбор того же пункта — не пишет в хранилище повторно',
      () async {
        final cubit = buildCubit();
        orgController.add([_org('org1', 'Org 1')]);
        await pumpEventQueue();

        cubit
          ..selectAll()
          ..selectAll();

        verify(() => storage.save(ShiftScope.all.value)).called(1);
        await cubit.close();
      },
    );

    test('авто-резолв (дефолт/перепроверка) не пишет в хранилище', () async {
      final cubit = buildCubit(savedMarker: 'org-deleted');

      orgController.add([_org('org1', 'Org 1')]);
      await pumpEventQueue();

      verifyNever(() => storage.save(any()));
      await cubit.close();
    });
  });
}
