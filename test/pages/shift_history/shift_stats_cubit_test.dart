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

  setUp(() {
    shiftRepo = _MockShiftRepository();
    when(
      () => shiftRepo.getStats(
        period: any(named: 'period'),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
      ),
    ).thenAnswer((_) async => const Task<ShiftStats>.success(_stats));
  });

  test('до первого setContext запрос не уходит', () {
    ShiftStatsCubit(shiftRepository: shiftRepo);

    verifyNever(
      () => shiftRepo.getStats(
        period: any(named: 'period'),
        dateFrom: any(named: 'dateFrom'),
        dateTo: any(named: 'dateTo'),
        scope: any(named: 'scope'),
        organizationId: any(named: 'organizationId'),
      ),
    );
  });

  test(
    'первый setContext запускает загрузку статистики с этим контекстом',
    () async {
      final cubit = ShiftStatsCubit(shiftRepository: shiftRepo)
        ..setContext(ShiftScope.organization, 'org1');
      await pumpEventQueue();

      expect(cubit.state.scope, ShiftScope.organization);
      expect(cubit.state.organizationId, 'org1');
      verify(
        () => shiftRepo.getStats(
          period: 'day',
          scope: ShiftScope.organization,
          organizationId: 'org1',
        ),
      ).called(1);
      await cubit.close();
    },
  );

  test(
    'повторный setContext с тем же контекстом — не перезапрашивает',
    () async {
      final cubit = ShiftStatsCubit(shiftRepository: shiftRepo)
        ..setContext(ShiftScope.personal, null);
      await pumpEventQueue();
      cubit.setContext(ShiftScope.personal, null);
      await pumpEventQueue();

      verify(
        () => shiftRepo.getStats(
          period: any(named: 'period'),
          dateFrom: any(named: 'dateFrom'),
          dateTo: any(named: 'dateTo'),
          scope: any(named: 'scope'),
          organizationId: any(named: 'organizationId'),
        ),
      ).called(1);
      await cubit.close();
    },
  );

  test(
    'смена контекста считает статистику по тому же контексту, что и список',
    () async {
      final cubit = ShiftStatsCubit(shiftRepository: shiftRepo)
        ..setContext(ShiftScope.all, null);
      await pumpEventQueue();

      cubit.setContext(ShiftScope.organization, 'org2');
      await pumpEventQueue();

      expect(cubit.state.scope, ShiftScope.organization);
      expect(cubit.state.organizationId, 'org2');
      verify(
        () => shiftRepo.getStats(
          period: 'day',
          scope: ShiftScope.organization,
          organizationId: 'org2',
        ),
      ).called(1);
      await cubit.close();
    },
  );
}
