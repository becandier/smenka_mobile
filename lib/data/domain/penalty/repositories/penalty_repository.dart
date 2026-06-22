import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/penalty/models/_models.dart';

/// Штрафы (фича fines).
///
/// admin/owner (`ensure_admin_or_owner`) назначает/исправляет/снимает штрафы и
/// видит список орг-штрафов и шаблоны; employee видит только свои штрафы
/// (`my-penalties`). Шаблоны заводятся только в веб-админке — мобилка лишь
/// выбирает их при назначении. Деньги — в копейках (int); окна — UTC,
/// `dateTo` включительно (фильтр по `occurred_at`).
abstract class PenaltyRepository {
  /// Активные шаблоны штрафов для выбора в форме назначения (admin/owner).
  Future<Task<List<PenaltyTemplate>>> getTemplates(String orgId);

  /// Список штрафов организации (admin/owner), пагинация offset,
  /// `occurred_at DESC`, только активные.
  Future<Task<DefaultPaginator<Penalty>>> getPenalties(
    String orgId, {
    String? memberId,
    String? shiftId,
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  });

  /// Деталь штрафа (для предзаполнения формы исправления).
  Future<Task<Penalty>> getPenalty(String orgId, String penaltyId);

  /// Назначить штраф (форма / быстрое «Оштрафовать»).
  Future<Task<Penalty>> assignPenalty(String orgId, CreatePenaltyInput input);

  /// Исправить запись штрафа.
  Future<Task<Penalty>> editPenalty(
    String orgId,
    String penaltyId,
    UpdatePenaltyInput input,
  );

  /// Снять штраф (soft-delete; доступно любому admin/owner).
  Future<Task<void>> removePenalty(String orgId, String penaltyId);

  /// Свои активные штрафы за период (employee), пагинация offset.
  Future<Task<DefaultPaginator<MyPenalty>>> getMyPenalties(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  });
}
