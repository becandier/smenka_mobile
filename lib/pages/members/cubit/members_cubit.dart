import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/user/repositories/user_repository.dart';
import 'package:smenka_mobile/pages/members/cubit/members_state.dart';

class MembersCubit extends Cubit<MembersState> {
  MembersCubit({
    required String orgId,
    required OrganizationRepository organizationRepository,
    required UserRepository userRepository,
  }) : _orgId = orgId,
       _organizationRepository = organizationRepository,
       _userRepository = userRepository,
       super(const MembersState()) {
    _init();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;
  final UserRepository _userRepository;

  String get orgId => _orgId;
  String get currentUserId => state.currentUserId;

  Future<void> _init() async {
    await Future.wait([_loadCurrentUser(), _loadViewerRole(), loadMembers()]);
  }

  Future<void> _loadCurrentUser() async {
    final result = await _userRepository.getMe();
    result.fold(
      onSuccess: (user) => emit(state.copyWith(currentUserId: user.id)),
      onFailure: (_) {},
    );
  }

  Future<void> _loadViewerRole() async {
    final result = await _organizationRepository.getById(_orgId);
    result.fold(
      onSuccess: (org) => emit(state.copyWith(viewerRole: org.myRole)),
      onFailure: (_) {},
    );
  }

  Future<void> loadMembers() async {
    emit(state.copyWith(members: state.members.toLoading()));
    final result = await _organizationRepository.getMembers(_orgId);
    result.fold(
      onSuccess: (members) {
        emit(state.copyWith(members: state.members.toSuccess(members)));
      },
      onFailure: (error) {
        emit(state.copyWith(members: state.members.toError(error.message)));
      },
    );
  }
}
