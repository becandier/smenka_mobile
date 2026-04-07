import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/location/models/_models.dart';

part 'locations_state.freezed.dart';

@freezed
abstract class LocationsState with _$LocationsState {
  const factory LocationsState({
    @Default(SectionData<List<WorkLocation>>())
    SectionData<List<WorkLocation>> locations,
    @Default(FeatureStatus.initial) FeatureStatus actionStatus,
    String? actionError,
  }) = _LocationsState;
}
