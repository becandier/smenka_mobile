import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/pages/super_admin/cubit/super_admin_state.dart';

class SuperAdminCubit extends Cubit<SuperAdminState> {
  SuperAdminCubit({
    required OrganizationRepository organizationRepository,
  })  : _organizationRepository = organizationRepository,
        super(const SuperAdminState()) {
    loadOrganizations();
  }

  final OrganizationRepository _organizationRepository;

  Future<void> loadOrganizations() async {
    emit(state.copyWith(organizations: state.organizations.toLoading()));
    final result = await _organizationRepository.getAllOrganizations();
    result.fold(
      onSuccess: (orgs) => emit(
        state.copyWith(organizations: state.organizations.toSuccess(orgs)),
      ),
      onFailure: (error) => emit(
        state.copyWith(
          organizations: state.organizations.toError(error.message),
        ),
      ),
    );
  }
}
