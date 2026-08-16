import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/utils/shift_lookup.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';

class _MockShiftRepository extends Mock implements ShiftRepository {}

Shift _shift(String id, DateTime startedAt) => Shift(
  id: id,
  userId: 'u1',
  startedAt: startedAt,
  status: ShiftStatus.finished,
  pauses: const [],
  workedSeconds: 3600,
);

void main() {
  group('findShiftByExactStart (manual_time_entry)', () {
    late _MockShiftRepository shiftRepo;
    final startedAt = DateTime.utc(2026, 8, 12, 6);

    setUp(() {
      shiftRepo = _MockShiftRepository();
    });

    test('фильтрует /shifts точным окном [startedAt, startedAt]', () async {
      when(
        () => shiftRepo.getShifts(dateFrom: startedAt, dateTo: startedAt),
      ).thenAnswer(
        (_) async => Task.success(
          DefaultPaginator(hasMore: false, data: [_shift('s1', startedAt)]),
        ),
      );

      final shift = await findShiftByExactStart(
        shiftRepo,
        shiftId: 's1',
        startedAt: startedAt,
      );

      expect(shift?.id, 's1');
      verify(
        () => shiftRepo.getShifts(dateFrom: startedAt, dateTo: startedAt),
      ).called(1);
    });

    test(
      'несколько смен с тем же started_at — выбирает нужную по id',
      () async {
        when(
          () => shiftRepo.getShifts(dateFrom: startedAt, dateTo: startedAt),
        ).thenAnswer(
          (_) async => Task.success(
            DefaultPaginator(
              hasMore: false,
              data: [_shift('other', startedAt), _shift('target', startedAt)],
            ),
          ),
        );

        final shift = await findShiftByExactStart(
          shiftRepo,
          shiftId: 'target',
          startedAt: startedAt,
        );

        expect(shift?.id, 'target');
      },
    );

    test(
      'смена не найдена в ответе (удалена/окно не совпало) → null',
      () async {
        when(
          () => shiftRepo.getShifts(dateFrom: startedAt, dateTo: startedAt),
        ).thenAnswer(
          (_) async =>
              Task.success(DefaultPaginator(hasMore: false, data: const [])),
        );

        final shift = await findShiftByExactStart(
          shiftRepo,
          shiftId: 's1',
          startedAt: startedAt,
        );

        expect(shift, isNull);
      },
    );

    test('сетевая/бизнес-ошибка → null, без исключения', () async {
      when(
        () => shiftRepo.getShifts(dateFrom: startedAt, dateTo: startedAt),
      ).thenAnswer(
        (_) async => const Task.failure(
          ApiException.server(message: 'сеть недоступна', code: 'DIO_ERROR'),
        ),
      );

      final shift = await findShiftByExactStart(
        shiftRepo,
        shiftId: 's1',
        startedAt: startedAt,
      );

      expect(shift, isNull);
    });
  });
}
