import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/utils/shift_lookup.dart';
import 'package:smenka_mobile/data/domain/notification/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';

/// Действие в payload уведомления `shift_manual_changed`
/// (`backend.md`: `created | updated | deleted | restored`).
enum _ShiftManualChangeAction {
  created('created'),
  updated('updated'),
  deleted('deleted'),
  restored('restored');

  const _ShiftManualChangeAction(this.value);

  final String value;

  /// Незнакомое (будущее) значение → `null` — форвард-совместимость, как и
  /// у `notification.type` целиком.
  static _ShiftManualChangeAction? fromValue(String? value) =>
      values.where((e) => e.value == value).firstOrNull;
}

/// Маппинг `notification.type → переход`, расширяемый: новый тип уведомления
/// добавляется новым `case` без правки остальной ленты/бэка.
///
/// Незнакомый (будущий) тип — форвард-совместимость: просто ничего не
/// открываем (уведомление уже помечено прочитанным вызывающей стороной).
Future<void> navigateForNotification(
  BuildContext context,
  AppNotification notification,
) async {
  switch (notification.type) {
    case 'test_assigned':
      final assignmentId = notification.payload?['assignment_id'] as String?;
      if (assignmentId != null) {
        unawaited(
          context.router.root.push(
            TestAttemptRoute(assignmentId: assignmentId),
          ),
        );
      }
    case 'shift_manual_changed':
      await _navigateToShift(context, notification.payload);
    case 'payroll_adjustment_changed':
      await _navigateToAdjustments(context);
    default:
      break;
  }
}

/// Деталь смены по `payload = { shift_id, action, started_at, ... }`.
/// `action == "deleted"` — уведомление остаётся информационным, перехода нет
/// (смена больше не читается ни одним эндпоинтом).
Future<void> _navigateToShift(
  BuildContext context,
  Map<String, dynamic>? payload,
) async {
  if (payload == null) return;
  final action = _ShiftManualChangeAction.fromValue(
    payload['action'] as String?,
  );
  if (action == _ShiftManualChangeAction.deleted) return;

  final shiftId = payload['shift_id'] as String?;
  final startedAtRaw = payload['started_at'] as String?;
  if (shiftId == null || startedAtRaw == null) return;
  final startedAt = DateTime.tryParse(startedAtRaw);
  if (startedAt == null) return;

  final shift = await findShiftByExactStart(
    context.read<ShiftRepository>(),
    shiftId: shiftId,
    startedAt: startedAt,
  );
  if (!context.mounted) return;
  if (shift == null) {
    context.modals.showError(context.l10n.notificationShiftUnavailable);
    return;
  }
  unawaited(context.router.root.push(ShiftDetailRoute(shift: shift)));
}

/// «Мои начисления» — `payload = { adjustment_id, action, amount_minor,
/// occurred_at }` не несёт `organization_id` (см. `NotificationOut` бэка),
/// поэтому орг для перехода резолвится клиентом: единственная организация
/// сотрудника — открываем её начисления напрямую; несколько — просим
/// открыть «Мой заработок» вручную (однозначно определить нельзя без
/// орг-контекста в уведомлении).
Future<void> _navigateToAdjustments(BuildContext context) async {
  final result = await context.read<OrganizationRepository>().getAll();
  if (!context.mounted) return;
  final orgs = result.dataOrNull;
  if (orgs != null && orgs.length == 1) {
    unawaited(
      context.router.root.push(MyAdjustmentsRoute(orgId: orgs.first.id)),
    );
    return;
  }
  context.modals.showInfo(context.l10n.notificationOpenMyEarningsHint);
}
