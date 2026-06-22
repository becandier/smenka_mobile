import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/pagination_mixin.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';
import 'package:smenka_mobile/pages/member_detail/cubit/member_penalties_state.dart';

/// Штрафы сотрудника на `member_detail` (admin/owner).
///
/// Загрузка НЕ стартует в конструкторе: секция рендерится только при
/// `canManage` — её и дёргает `loadPenalties` (как `MemberRatesCubit`).
/// Назначение/исправление штрафа выполняет модалка-форма; этот кубит
/// перезагружает список после успешной мутации и сам снимает штраф.
class MemberPenaltiesCubit extends Cubit<MemberPenaltiesState>
    with PaginationMixin<MemberPenaltiesState> {
  MemberPenaltiesCubit({
    required String orgId,
    required String memberId,
    required PenaltyRepository penaltyRepository,
  }) : _orgId = orgId,
       _memberId = memberId,
       _penaltyRepository = penaltyRepository,
       super(const MemberPenaltiesState());

  final String _orgId;
  final String _memberId;
  final PenaltyRepository _penaltyRepository;

  String get orgId => _orgId;
  String get memberId => _memberId;

  Future<void> loadPenalties({bool isRefresh = true}) {
    return fetchPaginated<Penalty>(
      getSection: (s) => s.penalties,
      updateState: (s, section) => s.copyWith(penalties: section),
      fetch: (page, perPage) => _penaltyRepository.getPenalties(
        _orgId,
        memberId: _memberId,
        limit: perPage,
        offset: (page - 1) * perPage,
      ),
      isRefresh: isRefresh,
    );
  }

  void loadMore() => loadPenalties(isRefresh: false);

  /// Снять штраф (soft-delete). Возвращает `null` при успехе (список
  /// перезагружается) либо код/сообщение ошибки для локализации на UI.
  Future<({String? code, String? message})?> removePenalty(
    String penaltyId,
  ) async {
    final result = await _penaltyRepository.removePenalty(_orgId, penaltyId);
    return result.fold(
      onSuccess: (_) {
        loadPenalties();
        return null;
      },
      onFailure: (error) => (code: error.code, message: error.message),
    );
  }
}
