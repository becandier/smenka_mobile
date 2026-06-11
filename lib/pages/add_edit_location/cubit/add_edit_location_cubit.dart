import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/location/models/_models.dart';
import 'package:smenka_mobile/data/domain/location/repositories/location_repository.dart';
import 'package:smenka_mobile/pages/add_edit_location/cubit/add_edit_location_state.dart';

class AddEditLocationCubit extends Cubit<AddEditLocationState> {
  AddEditLocationCubit({
    required String orgId,
    required LocationRepository locationRepository,
    WorkLocation? existingLocation,
  }) : _orgId = orgId,
       _locationRepository = locationRepository,
       super(
         existingLocation != null
             ? AddEditLocationState(
                 name: existingLocation.name,
                 latitude: existingLocation.latitude,
                 longitude: existingLocation.longitude,
                 radiusMeters: existingLocation.radiusMeters,
                 isEdit: true,
                 locationId: existingLocation.id,
               )
             : const AddEditLocationState(),
       );

  final String _orgId;
  final LocationRepository _locationRepository;

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  void updatePosition(double latitude, double longitude) {
    emit(state.copyWith(latitude: latitude, longitude: longitude));
  }

  void updateRadius(int radiusMeters) {
    emit(state.copyWith(radiusMeters: radiusMeters));
  }

  Future<bool> save() async {
    if (!state.isValid) return false;

    emit(state.copyWith(saveStatus: FeatureStatus.loading, saveError: null));

    final result = state.isEdit ? await _update() : await _create();

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(saveStatus: FeatureStatus.success));
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            saveStatus: FeatureStatus.error,
            saveError: error.message,
          ),
        );
        return false;
      },
    );
  }

  Future<Task<WorkLocation>> _create() {
    return _locationRepository.create(
      _orgId,
      name: state.name.trim(),
      latitude: state.latitude,
      longitude: state.longitude,
      radiusMeters: state.radiusMeters,
    );
  }

  Future<Task<WorkLocation>> _update() {
    final locationId = state.locationId;
    if (locationId == null) {
      return Future.value(
        const Task.failure(
          ApiException.server(message: 'Location ID is missing'),
        ),
      );
    }

    return _locationRepository.update(
      _orgId,
      locationId,
      name: state.name.trim(),
      latitude: state.latitude,
      longitude: state.longitude,
      radiusMeters: state.radiusMeters,
    );
  }
}
