import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/adjustment/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/adjustment/mappers/adjustment_mapper.dart';

Map<String, dynamic> _myAdjustmentJson({
  int amountMinor = 300000,
  String? comment,
  String? shiftId,
}) => {
  'id': 'adj1',
  'amount_minor': amountMinor,
  'currency': 'RUB',
  'reason': 'Доплата за 2 ч',
  'occurred_at': '2026-08-12T00:00:00Z',
  'created_at': '2026-08-12T10:00:00Z',
  'comment': comment,
  'shift_id': shiftId,
};

void main() {
  group('MyAdjustmentDto.fromJson + toDomain', () {
    test('переносит все поля, деньги — знаковый int копейки', () {
      final adjustment = MyAdjustmentDto.fromJson(
        _myAdjustmentJson(comment: 'Согласовано', shiftId: 's1'),
      ).toDomain();

      expect(adjustment.id, 'adj1');
      expect(adjustment.amountMinor, 300000);
      expect(adjustment.currency, 'RUB');
      expect(adjustment.reason, 'Доплата за 2 ч');
      expect(adjustment.comment, 'Согласовано');
      expect(adjustment.shiftId, 's1');
      expect(adjustment.occurredAt.isUtc, isTrue);
    });

    test('shift_id/comment nullable — начисление без привязки к смене', () {
      final adjustment = MyAdjustmentDto.fromJson(
        _myAdjustmentJson(),
      ).toDomain();

      expect(adjustment.shiftId, isNull);
      expect(adjustment.comment, isNull);
    });

    test('отрицательная сумма — удержание, знак сохраняется', () {
      final adjustment = MyAdjustmentDto.fromJson(
        _myAdjustmentJson(amountMinor: -50000),
      ).toDomain();

      expect(adjustment.amountMinor, -50000);
    });
  });

  group('PaginatedMyAdjustmentsDto.toDomain — hasMore', () {
    test('есть ещё страницы: offset + items.length < total', () {
      final paginator = PaginatedMyAdjustmentsDto(
        items: [MyAdjustmentDto.fromJson(_myAdjustmentJson())],
        total: 50,
        limit: 20,
        offset: 0,
      ).toDomain();

      expect(paginator.hasMore, isTrue);
      expect(paginator.total, 50);
      expect(paginator.data, hasLength(1));
    });

    test('последняя страница: offset + items.length == total → нет', () {
      final paginator = PaginatedMyAdjustmentsDto(
        items: [MyAdjustmentDto.fromJson(_myAdjustmentJson())],
        total: 21,
        limit: 20,
        offset: 20,
      ).toDomain();

      expect(paginator.hasMore, isFalse);
    });

    test('пустой результат total=0 → нет догрузки', () {
      final paginator = const PaginatedMyAdjustmentsDto(
        items: [],
        total: 0,
        limit: 20,
        offset: 0,
      ).toDomain();

      expect(paginator.hasMore, isFalse);
      expect(paginator.data, isEmpty);
    });
  });
}
