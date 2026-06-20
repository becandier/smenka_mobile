import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_detail_state.dart';

/// Read-only кубит детали участника.
///
/// Управление (смена роли, кастомные роли, overrides, удаление участника)
/// вынесено в веб-админку. Здесь — только просмотр: заголовок, эффективные
/// чек-листы и (через MemberRatesCubit) ставки read-only.
class MemberDetailCubit extends Cubit<MemberDetailState> {
  MemberDetailCubit({
    required String orgId,
    required Member member,
    required OrganizationRepository organizationRepository,
    required ChecklistRepository checklistRepository,
  }) : _orgId = orgId,
       _organizationRepository = organizationRepository,
       _checklistRepository = checklistRepository,
       super(MemberDetailState(member: member)) {
    _init();
  }

  final String _orgId;
  final OrganizationRepository _organizationRepository;
  final ChecklistRepository _checklistRepository;

  String get userId => state.member.userId;

  Future<void> _init() async {
    await _loadViewerRole();
    if (!state.canManage) return;
    await loadEffective();
  }

  Future<void> _loadViewerRole() async {
    final result = await _organizationRepository.getById(_orgId);
    result.fold(
      onSuccess: (org) => emit(state.copyWith(viewerRole: org.myRole)),
      onFailure: (_) {},
    );
  }

  Future<void> loadEffective() async {
    emit(state.copyWith(effective: state.effective.toLoading()));
    final result = await _checklistRepository.getEffectiveTemplates(
      _orgId,
      userId,
    );
    result.fold(
      onSuccess: (list) {
        emit(state.copyWith(effective: state.effective.toSuccess(list)));
      },
      onFailure: (error) {
        emit(state.copyWith(effective: state.effective.toError(error.message)));
      },
    );
  }
}
