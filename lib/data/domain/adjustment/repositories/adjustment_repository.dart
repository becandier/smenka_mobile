import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/adjustment/models/_models.dart';

/// Ручные начисления/удержания (`manual_time_entry`, `payroll_adjustments`).
///
/// Заводит/правит/отменяет начисления только owner/admin организации — из
/// веб-админки (вне scope мобилки). Сотрудник (`employee`) только читает
/// свои активные начисления за период. Деньги — в копейках (int, знаковые);
/// окна — UTC, `dateTo` включительно (фильтр по `occurred_at`).
///
/// Абстрактный интерфейс — конвенция репозиториев проекта (см. остальные
/// `Repository` в `data/domain/*`): сейчас у мобилки один read-эндпоинт, но
/// кубит получает репозиторий через DI (`RepositoryProvider`), как и
/// остальные.
// ignore: one_member_abstracts, reason: конвенция репозиториев проекта, см. doc-комментарий выше
abstract class AdjustmentRepository {
  /// Свои активные начисления за период (employee), пагинация offset,
  /// `occurred_at DESC`.
  Future<Task<DefaultPaginator<MyAdjustment>>> getMyAdjustments(
    String orgId, {
    DateTime? dateFrom,
    DateTime? dateTo,
    int limit = 20,
    int offset = 0,
  });
}
