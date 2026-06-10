import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/org_settings/cubit/org_settings_state.dart';

class OrgSettingsCubit extends Cubit<OrgSettingsState> {
  OrgSettingsCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
  })  : _orgId = orgId,
        _organizationRepository = organizationRepository,
        super(const OrgSettingsState()) {
    loadSettings();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;
  OrgSettings? _original;

  Future<void> loadSettings() async {
    emit(state.copyWith(settings: state.settings.toLoading()));
    final result = await _organizationRepository.getSettings(_orgId);

    result.fold(
      onSuccess: (settings) {
        _original = settings;
        emit(
          state.copyWith(
            settings: state.settings.toSuccess(settings),
            geoCheckEnabled: settings.geoCheckEnabled,
            autoFinishEnabled: settings.autoFinishHours != null,
            autoFinishHours: settings.autoFinishHours,
            maxPauseMinutes: settings.maxPauseMinutes,
            maxPausesPerShift: settings.maxPausesPerShift,
            hasChanges: false,
          ),
        );
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            settings: state.settings.toError(error.message),
          ),
        );
      },
    );
  }

  void setGeoCheck({required bool value}) {
    emit(state.copyWith(geoCheckEnabled: value));
    _checkChanges();
  }

  void setAutoFinishEnabled({required bool value}) {
    emit(
      state.copyWith(
        autoFinishEnabled: value,
        autoFinishHours: value ? (state.autoFinishHours ?? 8) : null,
      ),
    );
    _checkChanges();
  }

  void setAutoFinishHours(int? value) {
    emit(state.copyWith(autoFinishHours: value));
    _checkChanges();
  }

  void setMaxPauseMinutes(int? value) {
    emit(state.copyWith(maxPauseMinutes: value));
    _checkChanges();
  }

  void setMaxPausesPerShift(int? value) {
    emit(state.copyWith(maxPausesPerShift: value));
    _checkChanges();
  }

  void _checkChanges() {
    final original = _original;
    if (original == null) return;

    final effectiveAutoFinish =
        state.autoFinishEnabled ? state.autoFinishHours : null;
    final hasChanges = state.geoCheckEnabled != original.geoCheckEnabled ||
        effectiveAutoFinish != original.autoFinishHours ||
        state.maxPauseMinutes != original.maxPauseMinutes ||
        state.maxPausesPerShift != original.maxPausesPerShift;

    emit(state.copyWith(hasChanges: hasChanges));
  }

  Future<bool> saveSettings() async {
    emit(state.copyWith(saveStatus: FeatureStatus.loading));

    final result = await _organizationRepository.updateSettings(
      _orgId,
      geoCheckEnabled: state.geoCheckEnabled,
      autoFinishHours: state.autoFinishEnabled ? state.autoFinishHours : null,
      maxPauseMinutes: state.maxPauseMinutes,
      maxPausesPerShift: state.maxPausesPerShift,
    );

    return result.fold(
      onSuccess: (settings) {
        _original = settings;
        emit(
          state.copyWith(
            saveStatus: FeatureStatus.success,
            settings: state.settings.toSuccess(settings),
            geoCheckEnabled: settings.geoCheckEnabled,
            autoFinishEnabled: settings.autoFinishHours != null,
            autoFinishHours: settings.autoFinishHours,
            maxPauseMinutes: settings.maxPauseMinutes,
            maxPausesPerShift: settings.maxPausesPerShift,
            hasChanges: false,
          ),
        );
        return true;
      },
      onFailure: (error) {
        emit(state.copyWith(saveStatus: FeatureStatus.error));
        return false;
      },
    );
  }

  void resetSaveStatus() {
    emit(state.copyWith(saveStatus: FeatureStatus.initial));
  }
}
