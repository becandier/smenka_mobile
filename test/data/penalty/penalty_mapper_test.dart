import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/payroll/mappers/payroll_mapper.dart';
import 'package:smenka_mobile/data/infrastructure/penalty/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/penalty/mappers/penalty_mapper.dart';

Map<String, dynamic> _penaltyJson({
  String? templateId,
  String? shiftId,
  String? comment,
}) => {
  'id': 'pen1',
  'member_id': 'm1',
  'user_id': 'u1',
  'user_name': 'Иван',
  'template_id': templateId,
  'reason': 'Опоздание',
  'amount_minor': 50000,
  'currency': 'RUB',
  'shift_id': shiftId,
  'occurred_at': '2026-06-20T09:30:00Z',
  'comment': comment,
  'created_by_user_id': 'admin1',
  'created_at': '2026-06-20T10:00:00Z',
  'updated_at': '2026-06-20T10:00:00Z',
};

void main() {
  group('PenaltyDto.fromJson + toDomain', () {
    test('переносит все поля, деньги — int копейки, occurred_at в UTC', () {
      final penalty = PenaltyDto.fromJson(
        _penaltyJson(templateId: 'tpl1', shiftId: 's1', comment: 'к смене'),
      ).toDomain();

      expect(penalty.id, 'pen1');
      expect(penalty.memberId, 'm1');
      expect(penalty.userId, 'u1');
      expect(penalty.userName, 'Иван');
      expect(penalty.templateId, 'tpl1');
      expect(penalty.reason, 'Опоздание');
      expect(penalty.amountMinor, 50000);
      expect(penalty.currency, 'RUB');
      expect(penalty.shiftId, 's1');
      expect(penalty.comment, 'к смене');
      expect(penalty.createdByUserId, 'admin1');
      expect(penalty.occurredAt.isUtc, isTrue);
    });

    test('template_id/shift_id/comment nullable — бэк мог не прислать', () {
      final penalty = PenaltyDto.fromJson(_penaltyJson()).toDomain();

      expect(penalty.templateId, isNull);
      expect(penalty.shiftId, isNull);
      expect(penalty.comment, isNull);
    });
  });

  group('MyPenaltyDto.fromJson + toDomain', () {
    test('employee-facing: минимальный набор полей', () {
      final myPenalty = MyPenaltyDto.fromJson({
        'id': 'pen1',
        'reason': 'Невыход',
        'amount_minor': 100000,
        'currency': 'RUB',
        'occurred_at': '2026-06-20T09:30:00Z',
        'created_at': '2026-06-20T10:00:00Z',
      }).toDomain();

      expect(myPenalty.id, 'pen1');
      expect(myPenalty.amountMinor, 100000);
      expect(myPenalty.shiftId, isNull);
      expect(myPenalty.comment, isNull);
      expect(myPenalty.occurredAt.isUtc, isTrue);
    });
  });

  group('PaginatedPenaltiesDto.toDomain — hasMore', () {
    test('есть ещё страницы: offset + items.length < total', () {
      final paginator = PaginatedPenaltiesDto(
        items: [PenaltyDto.fromJson(_penaltyJson())],
        total: 50,
        limit: 20,
        offset: 0,
      ).toDomain();

      expect(paginator.hasMore, isTrue);
      expect(paginator.total, 50);
      expect(paginator.data, hasLength(1));
    });

    test('последняя страница: offset + items.length == total → нет', () {
      final paginator = PaginatedPenaltiesDto(
        items: [PenaltyDto.fromJson(_penaltyJson())],
        total: 41,
        limit: 20,
        offset: 40,
      ).toDomain();

      expect(paginator.hasMore, isFalse);
    });

    test('пустой результат total=0 → нет догрузки', () {
      final paginator = const PaginatedPenaltiesDto(
        items: [],
        total: 0,
        limit: 20,
        offset: 0,
      ).toDomain();

      expect(paginator.hasMore, isFalse);
      expect(paginator.data, isEmpty);
    });
  });

  group('Payroll additive (фича fines)', () {
    test('новые поля штрафов парсятся; net может быть отрицательным', () {
      final payroll = PayrollDto.fromJson({
        'period': {'date_from': null, 'date_to': null},
        'currency': 'RUB',
        'items': [
          {
            'user_id': 'u1',
            'user_name': 'Иван',
            'worked_seconds': 0,
            'shifts_count': 0,
            'gross_amount_minor': 0,
            'unpaid_seconds': 0,
            'unpaid_shifts_count': 0,
            'has_missing_rate': false,
            'penalty_amount_minor': 50000,
            'penalties_count': 1,
            'net_amount_minor': -50000,
          },
        ],
        'totals': {
          'worked_seconds': 0,
          'shifts_count': 0,
          'gross_amount_minor': 0,
          'penalty_amount_minor': 50000,
          'penalties_count': 1,
          'net_amount_minor': -50000,
        },
      }).toDomain();

      final item = payroll.items.first;
      expect(item.penaltyAmountMinor, 50000);
      expect(item.penaltiesCount, 1);
      expect(item.netAmountMinor, -50000);
      expect(payroll.totals.netAmountMinor, -50000);
    });

    test('старый ответ без полей штрафов → дефолт 0 (additive)', () {
      final payroll = PayrollDto.fromJson({
        'period': {'date_from': null, 'date_to': null},
        'currency': 'RUB',
        'items': [
          {
            'user_id': 'u1',
            'user_name': 'Иван',
            'worked_seconds': 3600,
            'shifts_count': 1,
            'gross_amount_minor': 100000,
            'unpaid_seconds': 0,
            'unpaid_shifts_count': 0,
            'has_missing_rate': false,
          },
        ],
        'totals': {
          'worked_seconds': 3600,
          'shifts_count': 1,
          'gross_amount_minor': 100000,
        },
      }).toDomain();

      expect(payroll.items.first.penaltyAmountMinor, 0);
      expect(payroll.items.first.netAmountMinor, 0);
      expect(payroll.totals.penaltiesCount, 0);
    });
  });
}
