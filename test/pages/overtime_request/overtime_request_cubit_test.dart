import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/pages/overtime_request/cubit/overtime_request_cubit.dart';

class _MockShiftRepository extends Mock implements ShiftRepository {}

ShiftOvertimeRequest _request({
  OvertimeStatus status = OvertimeStatus.pending,
}) => ShiftOvertimeRequest(
  id: 'req1',
  minutes: 30,
  status: status,
  comment: 'Задержался закрыть кассу',
  createdAt: DateTime.utc(2026, 6, 11, 18),
);

void main() {
  late _MockShiftRepository shiftRepo;

  setUp(() {
    shiftRepo = _MockShiftRepository();
  });

  OvertimeRequestCubit buildCubit() =>
      OvertimeRequestCubit(shiftId: 'shift1', shiftRepository: shiftRepo);

  test('submit успех → возвращает заявку, статус success', () async {
    when(
      () => shiftRepo.requestOvertime(
        'shift1',
        minutes: 30,
        comment: 'Задержался закрыть кассу',
      ),
    ).thenAnswer((_) async => Task<ShiftOvertimeRequest>.success(_request()));

    final cubit = buildCubit();
    final result = await cubit.submit(
      minutes: 30,
      comment: 'Задержался закрыть кассу',
    );

    expect(result?.id, 'req1');
    expect(cubit.state.submitStatus, FeatureStatus.success);
    await cubit.close();
  });

  test('submit падает по бизнес-коду → null, ошибка сохранена', () async {
    when(
      () => shiftRepo.requestOvertime(
        'shift1',
        minutes: 30,
        comment: any(named: 'comment'),
      ),
    ).thenAnswer(
      (_) async => const Task<ShiftOvertimeRequest>.failure(
        ApiException.server(
          message: 'Заявка по этой смене уже отправлена',
          code: 'OVERTIME_ALREADY_REQUESTED',
        ),
      ),
    );

    final cubit = buildCubit();
    final result = await cubit.submit(minutes: 30, comment: 'test');

    expect(result, isNull);
    expect(cubit.state.submitStatus, FeatureStatus.error);
    expect(cubit.state.submitErrorCode, 'OVERTIME_ALREADY_REQUESTED');
    await cubit.close();
  });
}
