import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/user/models/user.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
import 'package:smenka_mobile/pages/organization_detail/cubit/organization_detail_state.dart';

class OrganizationDetailCubit extends Cubit<OrganizationDetailState> {
  OrganizationDetailCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
    required UserRepository userRepository,
  })  : _orgId = orgId,
        _organizationRepository = organizationRepository,
        _userRepository = userRepository,
        super(const OrganizationDetailState()) {
    _init();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;
  final UserRepository _userRepository;

  bool get isOwner {
    final org = state.organization.data;
    return org != null && org.ownerId == state.currentUserId;
  }

  bool get isAdminOrOwner =>
      isOwner ||
      state.currentMemberRole == MemberRole.admin ||
      state.currentUserRole == UserRole.superAdmin;

  Future<void> _init() async {
    await _loadCurrentUser();
    await Future.wait([
      _loadOrganization(),
      _loadMembers(),
    ]);
  }

  Future<void> _loadCurrentUser() async {
    final result = await _userRepository.getMe();
    result.fold(
      onSuccess: (user) {
        emit(state.copyWith(
          currentUserId: user.id,
          currentUserRole: user.role,
        ),);
      },
      onFailure: (_) {},
    );
  }

  Future<void> _loadOrganization() async {
    emit(state.copyWith(organization: state.organization.toLoading()));
    final result = await _organizationRepository.getById(_orgId);

    result.fold(
      onSuccess: (org) {
        emit(state.copyWith(
          organization: state.organization.toSuccess(org),
          inviteCode: org.inviteCode,
        ),);
      },
      onFailure: (error) {
        emit(state.copyWith(
          organization: state.organization.toError(error.message),
        ),);
      },
    );
  }

  Future<void> _loadMembers() async {
    emit(state.copyWith(members: state.members.toLoading()));
    final result = await _organizationRepository.getMembers(_orgId);

    result.fold(
      onSuccess: (members) {
        MemberRole? myRole;
        final myMembership =
            members.where((m) => m.userId == state.currentUserId);
        if (myMembership.isNotEmpty) {
          myRole = myMembership.first.role;
        }
        emit(state.copyWith(
          members: state.members.toSuccess(members),
          currentMemberRole: myRole,
        ),);
      },
      onFailure: (error) {
        emit(state.copyWith(members: state.members.toError(error.message)));
      },
    );
  }

  Future<void> refresh() async {
    await Future.wait([
      _loadOrganization(),
      _loadMembers(),
    ]);
  }

  Future<void> rotateInviteCode() async {
    emit(state.copyWith(
      actionStatus: FeatureStatus.loading,
      actionError: null,
    ),);
    final result = await _organizationRepository.rotateInvite(_orgId);

    result.fold(
      onSuccess: (newCode) {
        emit(state.copyWith(
          actionStatus: FeatureStatus.success,
          inviteCode: newCode,
        ),);
      },
      onFailure: (error) {
        emit(state.copyWith(
          actionStatus: FeatureStatus.error,
          actionError: error.message,
        ),);
      },
    );
  }

  Future<bool> leaveOrganization() async {
    emit(state.copyWith(
      actionStatus: FeatureStatus.loading,
      actionError: null,
    ),);
    final result = await _organizationRepository.removeMember(
      _orgId,
      state.currentUserId,
    );

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        return true;
      },
      onFailure: (error) {
        emit(state.copyWith(
          actionStatus: FeatureStatus.error,
          actionError: error.message,
        ),);
        return false;
      },
    );
  }

  Future<bool> deleteOrganization() async {
    emit(state.copyWith(
      actionStatus: FeatureStatus.loading,
      actionError: null,
    ),);
    final result = await _organizationRepository.delete(_orgId);

    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(actionStatus: FeatureStatus.success));
        return true;
      },
      onFailure: (error) {
        emit(state.copyWith(
          actionStatus: FeatureStatus.error,
          actionError: error.message,
        ),);
        return false;
      },
    );
  }

  void resetActionStatus() {
    emit(state.copyWith(
      actionStatus: FeatureStatus.initial,
      actionError: null,
    ),);
  }
}
