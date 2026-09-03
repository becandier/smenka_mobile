import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/models/period_preset.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';
import 'package:smenka_mobile/data/domain/payroll/repositories/payroll_repository.dart';
import 'package:smenka_mobile/pages/my_earnings/cubit/my_earnings_cubit.dart';

class _MockPayrollRepository extends Mock implements PayrollRepository {}

class _MockOrganizationRepository extends Mock
    implements OrganizationRepository {}

const _earnings = MyEarnings(
  period: PayrollPeriod(),
  currency: 'RUB',
  workedSeconds: 3600,
  shiftsCount: 1,
  grossAmountMinor: 100000,
  hasMissingRate: false,
  netAmountMinor: 100000,
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
  late _MockPayrollRepository payrollRepo;
  late _MockOrganizationRepository orgRepo;

  setUp(() {
    payrollRepo = _MockPayrollRepository();
    orgRepo = _MockOrganizationRepository();
    when(
      () => payrollRepo.getMyEarnings(
        any(),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
      ),
    ).thenAnswer((_) async => const Task<MyEarnings>.success(_earnings));
    when(
      () => orgRepo.getById(any()),
    ).thenAnswer((_) async => Task<Organization>.success(_org()));
  });

  group('без границ периода (открыт обычным путём) — работает как раньше', () {
    test('стартовое состояние — пресет «месяц», без произвольного окна', () {
      final cubit = MyEarningsCubit(
        orgId: 'org1',
        payrollRepository: payrollRepo,
        organizationRepository: orgRepo,
      );

      expect(cubit.state.preset, PeriodPreset.month);
      expect(cubit.state.isCustomRange, isFalse);
      expect(cubit.state.customFrom, isNull);
      expect(cubit.state.customTo, isNull);
    });

    test('первый запрос уходит с границами пресета «месяц», а не '
        'переданными датами', () async {
      MyEarningsCubit(
        orgId: 'org1',
        payrollRepository: payrollRepo,
        organizationRepository: orgRepo,
      );
      await pumpEventQueue();

      final captured = verify(
        () => payrollRepo.getMyEarnings(
          'org1',
          dateFrom: captureAny(named: 'dateFrom'),
          dateTo: captureAny(named: 'dateTo'),
        ),
      ).captured;
      expect(captured[0], isNotNull);
      expect(captured[1], isNotNull);
    });
  });

  group('переход из истории смен передаёт выбранный период '
      '(earnings_drilldown/mobile.md, «A»)', () {
    final historyFrom = DateTime.utc(2026, 6);
    final historyTo = DateTime.utc(2026, 6, 7, 23, 59, 59);

    test('стартовое состояние — произвольное окно с переданными границами, '
        'не пресет', () {
      final cubit = MyEarningsCubit(
        orgId: 'org1',
        payrollRepository: payrollRepo,
        organizationRepository: orgRepo,
        initialDateFrom: historyFrom,
        initialDateTo: historyTo,
      );

      expect(cubit.state.preset, isNull);
      expect(cubit.state.isCustomRange, isTrue);
      expect(cubit.state.customFrom, historyFrom);
      expect(cubit.state.customTo, historyTo);
    });

    test('первый запрос уходит ровно с этими границами — то же окно, что '
        'было выбрано в истории', () async {
      MyEarningsCubit(
        orgId: 'org1',
        payrollRepository: payrollRepo,
        organizationRepository: orgRepo,
        initialDateFrom: historyFrom,
        initialDateTo: historyTo,
      );
      await pumpEventQueue();

      verify(
        () => payrollRepo.getMyEarnings(
          'org1',
          dateFrom: historyFrom,
          dateTo: historyTo,
        ),
      ).called(1);
    });

    test('пользователь может переключить пресет после открытия из истории — '
        'кубит не залипает на произвольном окне', () async {
      final cubit = MyEarningsCubit(
        orgId: 'org1',
        payrollRepository: payrollRepo,
        organizationRepository: orgRepo,
        initialDateFrom: historyFrom,
        initialDateTo: historyTo,
      );
      await pumpEventQueue();

      cubit.setPreset(PeriodPreset.week);
      await pumpEventQueue();

      expect(cubit.state.preset, PeriodPreset.week);
      expect(cubit.state.isCustomRange, isFalse);
    });
  });
}
