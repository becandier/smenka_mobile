import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/location/repositories/location_repository.dart';
import 'package:smenka_mobile/pages/work_locations/cubit/locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit({
    required String orgId,
    required LocationRepository locationRepository,
  })  : _orgId = orgId,
        _locationRepository = locationRepository,
        super(const LocationsState()) {
    loadLocations();
  }

  final String _orgId;
  final LocationRepository _locationRepository;

  String get orgId => _orgId;

  Future<void> loadLocations() async {
    emit(state.copyWith(locations: state.locations.toLoading()));
    final result = await _locationRepository.getAll(_orgId);
    result.fold(
      onSuccess: (locations) {
        emit(state.copyWith(locations: state.locations.toSuccess(locations)));
      },
      onFailure: (error) {
        emit(state.copyWith(locations: state.locations.toError(error.message)));
      },
    );
  }

  Future<bool> deleteLocation(String locationId) async {
    emit(
      state.copyWith(actionStatus: FeatureStatus.loading, actionError: null),
    );
    final result = await _locationRepository.delete(_orgId, locationId);
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        loadLocations();
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            actionStatus: FeatureStatus.error,
            actionError: error.message,
          ),
        );
        return false;
      },
    );
  }

  void resetActionStatus() {
    emit(
      state.copyWith(actionStatus: FeatureStatus.initial, actionError: null),
    );
  }
}
