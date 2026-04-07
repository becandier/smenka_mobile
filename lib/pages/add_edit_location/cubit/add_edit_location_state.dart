import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

part 'add_edit_location_state.freezed.dart';

@freezed
abstract class AddEditLocationState with _$AddEditLocationState {
  const factory AddEditLocationState({
    @Default('') String name,
    @Default(55.751244) double latitude,
    @Default(37.618423) double longitude,
    @Default(100) int radiusMeters,
    @Default(false) bool isEdit,
    String? locationId,
    @Default(FeatureStatus.initial) FeatureStatus saveStatus,
    String? saveError,
  }) = _AddEditLocationState;
  const AddEditLocationState._();

  bool get isValid => name.trim().isNotEmpty;
}
