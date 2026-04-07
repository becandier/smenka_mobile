import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

part 'super_admin_state.freezed.dart';

@freezed
abstract class SuperAdminState with _$SuperAdminState {
  const factory SuperAdminState({
    @Default(SectionData<List<Organization>>())
    SectionData<List<Organization>> organizations,
  }) = _SuperAdminState;
}
