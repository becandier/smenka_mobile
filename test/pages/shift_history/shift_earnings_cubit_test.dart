import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/payroll/models/_models.dart';
import 'package:smenka_mobile/data/domain/payroll/repositories/payroll_repository.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_earnings_cubit.dart';

class _MockPayrollRepository extends Mock implements PayrollRepository {}

const _earnings = MyEarnings(
  period: PayrollPeriod(),
  currency: 'RUB',
  workedSeconds: 3600,
  shiftsCount: 1,
  grossAmountMinor: 100000,
  hasMissingRate: false,
  netAmountMinor: 100000,
);

void main() {
  late _MockPayrollRepository payrollRepo;

  final periodFrom = DateTime.utc(2026, 6);
  final periodTo = DateTime.utc(2026, 6, 7, 23, 59, 59);

  setUp(() {
    payrollRepo = _MockPayrollRepository();
    when(
      () => payrollRepo.getMyEarnings(
        any(),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
      ),
    ).thenAnswer((_) async => const Task<MyEarnings>.success(_earnings));
  });

  test('до применения контекста и периода запрос не уходит', () {
    ShiftEarningsCubit(payrollRepository: payrollRepo);

    verifyNever(
      () => payrollRepo.getMyEarnings(
        any(),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
      ),
    );
  });

  test('scope == organization — запрос уходит с общими границами и id '
      'организации', () async {
    final cubit = ShiftEarningsCubit(payrollRepository: payrollRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();
    cubit.setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    expect(cubit.state.earnings.isSuccess, isTrue);
    expect(cubit.state.earnings.data, _earnings);
    verify(
      () => payrollRepo.getMyEarnings(
        'org1',
        dateFrom: periodFrom,
        dateTo: periodTo,
      ),
    ).called(1);
    await cubit.close();
  });

  test('scope == personal — запрос заработка не уходит вовсе', () async {
    final cubit = ShiftEarningsCubit(payrollRepository: payrollRepo)
      ..setContext(ShiftScope.personal, null)
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    verifyNever(
      () => payrollRepo.getMyEarnings(
        any(),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
      ),
    );
    expect(cubit.state.earnings.hasData, isFalse);
    expect(cubit.state.earnings.isLoading, isFalse);
    await cubit.close();
  });

  test('scope == all — запрос заработка не уходит вовсе', () async {
    final cubit = ShiftEarningsCubit(payrollRepository: payrollRepo)
      ..setContext(ShiftScope.all, null)
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    verifyNever(
      () => payrollRepo.getMyEarnings(
        any(),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
      ),
    );
    await cubit.close();
  });

  test('переключение с организации на «персональные» сбрасывает данные '
      'предыдущей организации', () async {
    final cubit = ShiftEarningsCubit(payrollRepository: payrollRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();
    cubit.setPeriod(periodFrom, periodTo);
    await pumpEventQueue();
    expect(cubit.state.earnings.isSuccess, isTrue);

    cubit.setContext(ShiftScope.personal, null);
    await pumpEventQueue();

    expect(cubit.state.earnings.hasData, isFalse);
    await cubit.close();
  });

  test(
    'ошибка запроса заработка переводит секцию в error, не бросая',
    () async {
      when(
        () => payrollRepo.getMyEarnings(
          any(),
          dateFrom: any(named: 'dateFrom'),
          dateTo: any(named: 'dateTo'),
        ),
      ).thenAnswer(
        (_) async => const Task<MyEarnings>.failure(
          ApiException.server(message: 'boom', code: 'SOME_ERROR'),
        ),
      );

      final cubit = ShiftEarningsCubit(payrollRepository: payrollRepo)
        ..setContext(ShiftScope.organization, 'org1');
      await pumpEventQueue();
      cubit.setPeriod(periodFrom, periodTo);
      await pumpEventQueue();

      expect(cubit.state.earnings.status, FeatureStatus.error);
      expect(cubit.state.earnings.errorCode, 'SOME_ERROR');
      await cubit.close();
    },
  );

  test('retry() повторяет запрос после ошибки', () async {
    when(
      () => payrollRepo.getMyEarnings(
        any(),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
      ),
    ).thenAnswer(
      (_) async =>
          const Task<MyEarnings>.failure(ApiException.server(message: 'boom')),
    );

    final cubit = ShiftEarningsCubit(payrollRepository: payrollRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();
    cubit.setPeriod(periodFrom, periodTo);
    await pumpEventQueue();
    expect(cubit.state.earnings.status, FeatureStatus.error);

    when(
      () => payrollRepo.getMyEarnings(
        any(),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
      ),
    ).thenAnswer((_) async => const Task<MyEarnings>.success(_earnings));

    await cubit.retry();

    expect(cubit.state.earnings.isSuccess, isTrue);
    await cubit.close();
  });
}
