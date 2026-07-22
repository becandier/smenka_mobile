import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_detail/cubit/shift_detail_cubit.dart';

class _MockShiftRepository extends Mock implements ShiftRepository {}

class _MockOrganizationRepository extends Mock
    implements OrganizationRepository {}

Shift _personalShift() => Shift(
  id: 's1',
  userId: 'u1',
  startedAt: DateTime.utc(2026, 6, 11, 10),
  status: ShiftStatus.finished,
  finishedAt: DateTime.utc(2026, 6, 11, 18),
  pauses: const [],
  workedSeconds: 3600,
);

Shift _orgShiftWithSchedule() => Shift(
  id: 's2',
  userId: 'u1',
  organizationId: 'org1',
  startedAt: DateTime.utc(2026, 6, 11, 6),
  status: ShiftStatus.finished,
  finishedAt: DateTime.utc(2026, 6, 11, 15),
  scheduledStartAt: DateTime.utc(2026, 6, 11, 6),
  scheduledEndAt: DateTime.utc(2026, 6, 11, 15),
  pauses: const [],
  workedSeconds: 3600 * 9,
);

Organization _org() => Organization(
  id: 'org1',
  name: 'Org 1',
  ownerId: 'owner1',
  inviteCode: 'INV12345',
  isDeleted: false,
  createdAt: DateTime.utc(2026),
);

void main() {
  late _MockShiftRepository shiftRepo;
  late _MockOrganizationRepository orgRepo;

  setUp(() {
    shiftRepo = _MockShiftRepository();
    orgRepo = _MockOrganizationRepository();
    when(
      () => orgRepo.getById(any()),
    ).thenAnswer((_) async => Task<Organization>.success(_org()));
  });

  test('персональная смена без графика — организация не запрашивается', () {
    final cubit = ShiftDetailCubit(
      shift: _personalShift(),
      shiftRepository: shiftRepo,
      organizationRepository: orgRepo,
    );

    verifyNever(() => orgRepo.getById(any()));
    expect(cubit.state.organization.hasData, isFalse);
    cubit.close();
  });

  test(
    'орг-смена с графиком — организация грузится (таймзона плана)',
    () async {
      when(
        () => orgRepo.getById('org1'),
      ).thenAnswer((_) async => Task<Organization>.success(_org()));

      final cubit = ShiftDetailCubit(
        shift: _orgShiftWithSchedule(),
        shiftRepository: shiftRepo,
        organizationRepository: orgRepo,
      );
      await pumpEventQueue();

      verify(() => orgRepo.getById('org1')).called(1);
      expect(cubit.state.organization.data?.timezone, 'Europe/Moscow');
      await cubit.close();
    },
  );

  test('applyOvertimeRequest — заявка применяется к смене в стейте', () async {
    final cubit = ShiftDetailCubit(
      shift: _orgShiftWithSchedule(),
      shiftRepository: shiftRepo,
      organizationRepository: orgRepo,
    );
    await pumpEventQueue();

    final request = ShiftOvertimeRequest(
      id: 'req1',
      minutes: 30,
      status: OvertimeStatus.pending,
      comment: 'Задержался',
      createdAt: DateTime.utc(2026, 6, 11, 18),
    );
    cubit.applyOvertimeRequest(request);

    expect(cubit.state.shift.overtime?.id, 'req1');
    await cubit.close();
  });

  test('cancelOvertimeRequest успех → overtime очищен', () async {
    when(
      () => shiftRepo.cancelOvertimeRequest('s2'),
    ).thenAnswer((_) async => const Task<void>.success(null));

    final shift = _orgShiftWithSchedule().copyWith(
      overtime: ShiftOvertimeRequest(
        id: 'req1',
        minutes: 30,
        status: OvertimeStatus.pending,
        comment: 'Задержался',
        createdAt: DateTime.utc(2026, 6, 11, 18),
      ),
    );
    final cubit = ShiftDetailCubit(
      shift: shift,
      shiftRepository: shiftRepo,
      organizationRepository: orgRepo,
    );

    final ok = await cubit.cancelOvertimeRequest();

    expect(ok, isTrue);
    expect(cubit.state.shift.overtime, isNull);
    expect(cubit.state.actionStatus, FeatureStatus.success);
    await cubit.close();
  });

  test('cancelOvertimeRequest ошибка → overtime не трогается', () async {
    when(() => shiftRepo.cancelOvertimeRequest('s2')).thenAnswer(
      (_) async => const Task<void>.failure(
        ApiException.server(
          message: 'Заявка уже рассмотрена',
          code: 'OVERTIME_ALREADY_REVIEWED',
        ),
      ),
    );

    final overtime = ShiftOvertimeRequest(
      id: 'req1',
      minutes: 30,
      status: OvertimeStatus.pending,
      comment: 'Задержался',
      createdAt: DateTime.utc(2026, 6, 11, 18),
    );
    final cubit = ShiftDetailCubit(
      shift: _orgShiftWithSchedule().copyWith(overtime: overtime),
      shiftRepository: shiftRepo,
      organizationRepository: orgRepo,
    );

    final ok = await cubit.cancelOvertimeRequest();

    expect(ok, isFalse);
    expect(cubit.state.shift.overtime?.id, 'req1');
    expect(cubit.state.actionErrorCode, 'OVERTIME_ALREADY_REVIEWED');
    await cubit.close();
  });
}
