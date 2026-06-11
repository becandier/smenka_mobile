import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';

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
}
