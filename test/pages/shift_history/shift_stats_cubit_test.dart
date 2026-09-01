import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/shift_history/cubit/shift_stats_cubit.dart';

class _MockShiftRepository extends Mock implements ShiftRepository {}

const _stats = ShiftStats(
  totalWorkedSeconds: 3600,
  shiftCount: 1,
  averageShiftSeconds: 3600,
);

void main() {
  late _MockShiftRepository shiftRepo;

  final periodFrom = DateTime.utc(2026, 6);
  final periodTo = DateTime.utc(2026, 6, 7, 23, 59, 59);

  setUp(() {
    shiftRepo = _MockShiftRepository();
    when(
      () => shiftRepo.getStats(
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
      ),
    ).thenAnswer((_) async => const Task<ShiftStats>.success(_stats));
  });

  test('до применения контекста и периода запрос не уходит', () {
    ShiftStatsCubit(shiftRepository: shiftRepo);

    verifyNever(
      () => shiftRepo.getStats(
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
      ),
    );
  });

  test('только setContext (без периода) не запускает загрузку', () async {
    final cubit = ShiftStatsCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();

    verifyNever(
      () => shiftRepo.getStats(
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
      ),
    );
    await cubit.close();
  });

  test('setContext, затем setPeriod — запускают загрузку с общими границами '
      '(серверный `period` не передаётся)', () async {
    final cubit = ShiftStatsCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1');
    await pumpEventQueue();
    cubit.setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    expect(cubit.state.scope, ShiftScope.organization);
    expect(cubit.state.organizationId, 'org1');
    expect(cubit.state.dateFrom, periodFrom);
    expect(cubit.state.dateTo, periodTo);
    verify(
      () => shiftRepo.getStats(
        dateFrom: periodFrom,
        dateTo: periodTo,
        scope: ShiftScope.organization,
        organizationId: 'org1',
      ),
    ).called(1);
    await cubit.close();
  });

  test(
    'повторный setContext с тем же контекстом — не перезапрашивает',
    () async {
      final cubit = ShiftStatsCubit(shiftRepository: shiftRepo)
        ..setContext(ShiftScope.personal, null)
        ..setPeriod(periodFrom, periodTo);
      await pumpEventQueue();
      cubit.setContext(ShiftScope.personal, null);
      await pumpEventQueue();

      verify(
        () => shiftRepo.getStats(
          dateFrom: any(named: 'dateFrom'),
          dateTo: any(named: 'dateTo'),
          scope: any(named: 'scope'),
          organizationId: any(named: 'organizationId'),
        ),
      ).called(1);
      await cubit.close();
    },
  );

  test('смена контекста считает статистику по тому же контексту и периоду, '
      'что и список', () async {
    final cubit = ShiftStatsCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.all, null)
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    cubit.setContext(ShiftScope.organization, 'org2');
    await pumpEventQueue();

    expect(cubit.state.scope, ShiftScope.organization);
    expect(cubit.state.organizationId, 'org2');
    verify(
      () => shiftRepo.getStats(
        dateFrom: periodFrom,
        dateTo: periodTo,
        scope: ShiftScope.organization,
        organizationId: 'org2',
      ),
    ).called(1);
    await cubit.close();
  });

  test('смена периода перезапрашивает статистику с новыми границами', () async {
    final cubit = ShiftStatsCubit(shiftRepository: shiftRepo)
      ..setContext(ShiftScope.organization, 'org1')
      ..setPeriod(periodFrom, periodTo);
    await pumpEventQueue();

    final newFrom = DateTime.utc(2026, 7);
    final newTo = DateTime.utc(2026, 7, 31, 23, 59, 59);
    cubit.setPeriod(newFrom, newTo);
    await pumpEventQueue();

    expect(cubit.state.dateFrom, newFrom);
    expect(cubit.state.dateTo, newTo);
    verify(
      () => shiftRepo.getStats(
        dateFrom: newFrom,
        dateTo: newTo,
        scope: ShiftScope.organization,
        organizationId: 'org1',
      ),
    ).called(1);
    await cubit.close();
  });
}
