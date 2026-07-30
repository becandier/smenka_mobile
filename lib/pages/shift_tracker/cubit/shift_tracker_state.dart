import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';

part 'shift_tracker_state.freezed.dart';

@freezed
abstract class ShiftTrackerState with _$ShiftTrackerState {
  const factory ShiftTrackerState({
    /// Активная смена (SectionData — loading/error на init, success при наличии)
    @Default(SectionData<Shift>()) SectionData<Shift> activeShift,

    /// Организации пользователя
    @Default(SectionData<List<Organization>>())
    SectionData<List<Organization>> organizations,

    /// Выбранная организация (null = персональная)
    String? selectedOrganizationId,

    /// Таймер — обновляется каждую секунду
    @Default(0) int elapsedSeconds,

    /// Статус действия (start/pause/resume/finish) — transient
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,

    /// Машинный `error.code` последнего действия (для маппинга сетевых ошибок)
    String? actionErrorCode,

    /// Нет сетевого подключения (по данным connectivity_plus)
    @Default(false) bool isOffline,

    /// Предупреждение о низкой точности GPS
    @Default(false) bool showLowAccuracyWarning,

    /// Одноразовый нотис: смену авто-завершил бэкенд (поллинг обнаружил, что
    /// активной/приостановленной смены больше нет). UI показывает тост и
    /// сбрасывает флаг.
    @Default(false) bool shiftAutoFinished,

    /// Выбранная сотрудником рабочая точка для старта смены (когда гео
    /// выключена). `null` — не выбрана; при смене организации сбрасывается.
    WorkLocation? selectedWorkLocation,

    /// Эффективный набор графиков сотрудника для выбранной организации+точки
    /// (`work_schedules`). Только для орг-смены — для персональной остаётся
    /// в начальном состоянии.
    @Default(SectionData<MySchedules>()) SectionData<MySchedules> schedules,

    /// Выбранный график старта. `null` — не выбран (0 графиков, либо >1 и
    /// выбор ещё не сделан).
    String? selectedWorkScheduleId,
  }) = _ShiftTrackerState;
  const ShiftTrackerState._();

  bool get hasActiveShift => activeShift.hasData;
  bool get isShiftActive => activeShift.data?.status == ShiftStatus.active;
  bool get isShiftPaused => activeShift.data?.status == ShiftStatus.paused;
  bool get isActionLoading => actionStatus == FeatureStatus.loading;
  bool get hasActionError => actionStatus == FeatureStatus.error;

  /// Последнее действие упало из-за сети (NETWORK_ERROR/CONNECTION_ERROR)
  bool get isActionNetworkError =>
      actionErrorCode == 'NETWORK_ERROR' ||
      actionErrorCode == 'CONNECTION_ERROR';
  bool get hasOrganizations {
    final orgs = organizations.data;
    return orgs != null && orgs.isNotEmpty;
  }

  Organization? get selectedOrganization {
    if (selectedOrganizationId == null) return null;
    final orgs = organizations.data;
    if (orgs == null) return null;
    return orgs.where((o) => o.id == selectedOrganizationId).firstOrNull;
  }

  /// Организация активной смены. НЕ то же самое, что [selectedOrganization]:
  /// при холодном старте с уже активной орг-сменой предвыбор контекста
  /// (`_maybePreselectContext`) сознательно не трогает `selectedOrganizationId`
  /// (это поле селектора idle-экрана) — поэтому таймзону для планового
  /// времени активной смены резолвим напрямую по `activeShift.organizationId`.
  Organization? get activeShiftOrganization {
    final orgId = activeShift.data?.organizationId;
    if (orgId == null) return null;
    final orgs = organizations.data;
    if (orgs == null) return null;
    return orgs.where((o) => o.id == orgId).firstOrNull;
  }

  /// Показывать ли селектор точки: гео у выбранной org выключена, значит
  /// точку выбирает сотрудник. При включённой гео её определяет сервер.
  bool get showWorkLocationSelector {
    final org = selectedOrganization;
    return org != null && !org.geoCheckEnabled;
  }

  /// Привязка точки обязательна: гео выключена и org требует точку
  /// (`require_work_location`). Кнопка старта заблокирована до выбора.
  bool get requiresWorkLocation {
    final org = selectedOrganization;
    return org != null && !org.geoCheckEnabled && org.requireWorkLocation;
  }

  /// Смена организационная — только для неё применяются графики.
  bool get isOrgShift => selectedOrganizationId != null;

  /// Показывать ли предпросмотр графика на idle-экране (до нажатия
  /// «Начать»). Только для организаций без гео-проверки — точка выбрана
  /// вручную и известна заранее, поэтому набор графиков можно показать
  /// заблаговременно. Для гео-check организаций точка известна только
  /// серверу в момент старта — резолв идёт внутри `ShiftTrackerCubit.
  /// startShift`, без предпросмотра (см.
  /// docs/tasks/work_schedules_geo_resolve/mobile.md).
  bool get showSchedulePreview => showWorkLocationSelector;

  List<WorkSchedule> get availableSchedules =>
      schedules.data?.items ?? const <WorkSchedule>[];

  /// Обязательность графика по настройке организации. Пока набор графиков не
  /// загружен успешно (ошибка/ещё не начали грузить) — считаем `false`, а не
  /// блокируем старт из-за неизвестности (см. ТЗ: сетевой сбой не должен
  /// мешать работать).
  bool get requireSchedule => schedules.data?.requireSchedule ?? false;

  bool get schedulesLoading => schedules.isLoading;

  /// 0 доступных графиков при обязательной настройке — старт заблокирован,
  /// нужно обратиться к администратору.
  bool get scheduleBlockedNoOptions =>
      schedules.data != null && availableSchedules.isEmpty && requireSchedule;

  /// >1 графика — выбор обязателен на клиенте, даже если организация не
  /// требует этого явно (см. ТЗ п.1).
  bool get scheduleSelectionRequired => availableSchedules.length > 1;

  WorkSchedule? get selectedWorkSchedule {
    final id = selectedWorkScheduleId;
    if (id == null) return null;
    return availableSchedules.where((s) => s.id == id).firstOrNull;
  }

  /// Можно ли начать смену: точка (если обязательна) и график (если
  /// обязателен по количеству доступных вариантов) должны быть выбраны;
  /// пока список графиков грузится — старт недоступен. Для персональной
  /// смены графики не проверяются вовсе (shift_quick_start не меняется).
  bool get canStartShift =>
      (!requiresWorkLocation || selectedWorkLocation != null) &&
      (!isOrgShift ||
          (!schedulesLoading &&
              !scheduleBlockedNoOptions &&
              (!scheduleSelectionRequired || selectedWorkScheduleId != null)));
}
