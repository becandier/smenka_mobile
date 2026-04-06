import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/user/models/_models.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(SectionData<User>()) SectionData<User> user,
    @Default(SectionData<List<Organization>>())
    SectionData<List<Organization>> organizations,
    @Default(FeatureStatus.initial) FeatureStatus updateStatus,
    String? updateError,
  }) = _ProfileState;
}
