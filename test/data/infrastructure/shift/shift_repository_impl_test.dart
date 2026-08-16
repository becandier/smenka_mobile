import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/shift/_shift.dart';

class _MockShiftDataSource extends Mock implements ShiftDataSource {}

Map<String, dynamic> _shiftJson([Map<String, dynamic> overrides = const {}]) {
  return {
    'id': 'shift1',
    'user_id': 'u1',
    'started_at': '2026-08-12T06:00:00Z',
    'status': 'finished',
    'pauses': <dynamic>[],
    'worked_seconds': 3600,
    ...overrides,
  };
}

void main() {
  group('ShiftRepositoryImpl.getShiftById (shift_self_detail)', () {
    late _MockShiftDataSource dataSource;
    late ShiftRepositoryImpl repository;

    setUp(() {
      dataSource = _MockShiftDataSource();
      repository = ShiftRepositoryImpl(dataSource: dataSource);
    });

    test('своя смена найдена → Task.success со смапленным Shift', () async {
      when(
        () => dataSource.getShiftById('shift1'),
      ).thenAnswer((_) async => ShiftDto.fromJson(_shiftJson()));

      final result = await repository.getShiftById('shift1');

      expect(result, isA<TaskSuccess<Shift>>());
      final shift = (result as TaskSuccess<Shift>).data;
      expect(shift.id, 'shift1');
      verify(() => dataSource.getShiftById('shift1')).called(1);
    });

    test(
      'чужая/несуществующая/удалённая смена → Task.failure(SHIFT_NOT_FOUND)',
      () async {
        when(() => dataSource.getShiftById('missing')).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: '/shifts/missing'),
            error: const ApiException.server(
              message: 'Смена не найдена',
              code: 'SHIFT_NOT_FOUND',
            ),
          ),
        );

        final result = await repository.getShiftById('missing');

        expect(result, isA<TaskFailure<Shift>>());
        final error = (result as TaskFailure<Shift>).error;
        expect(error.code, 'SHIFT_NOT_FOUND');
      },
    );
  });
}
