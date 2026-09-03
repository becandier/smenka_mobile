import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';
import 'package:smenka_mobile/pages/penalty_form/cubit/penalty_form_state.dart';

/// Логика модалки «Назначить/Исправить штраф»: загрузка шаблонов для выбора
/// и отправка формы (POST/PATCH). Поля формы (причина/сумма/смена/дата/
/// комментарий) живут в самом виджете; кубит держит только шаблоны, таймзону
/// организации (для wall-time выбора/показа `occurredAt`) и статус отправки.
class PenaltyFormCubit extends Cubit<PenaltyFormState> {
  PenaltyFormCubit({
    required String orgId,
    required PenaltyRepository penaltyRepository,
    required OrganizationRepository organizationRepository,
  }) : _orgId = orgId,
       _penaltyRepository = penaltyRepository,
       _organizationRepository = organizationRepository,
       super(const PenaltyFormState()) {
    loadTemplates();
    unawaited(_loadOrganizationTimezone());
  }

  final String _orgId;
  final PenaltyRepository _penaltyRepository;
  final OrganizationRepository _organizationRepository;

  /// Один запрос за время жизни экрана (см. `MyPenaltiesCubit`, тот же
  /// приём). Ошибка молча оставляет дефолт.
  Future<void> _loadOrganizationTimezone() async {
    final result = await _organizationRepository.getById(_orgId);
    result.fold(
      onSuccess: (org) =>
          emit(state.copyWith(organizationTimezone: org.timezone)),
      onFailure: (_) {},
    );
  }

  Future<void> loadTemplates() async {
    emit(state.copyWith(templates: state.templates.toLoading()));
    final result = await _penaltyRepository.getTemplates(_orgId);
    result.fold(
      onSuccess: (list) =>
          emit(state.copyWith(templates: state.templates.toSuccess(list))),
      onFailure: (error) => emit(
        state.copyWith(
          templates: state.templates.toError(error.message, code: error.code),
        ),
      ),
    );
  }

  /// Назначить штраф. `true` — успех (модалку закрывают).
  Future<bool> submitCreate(CreatePenaltyInput input) {
    return _submit(() => _penaltyRepository.assignPenalty(_orgId, input));
  }

  /// Исправить штраф. `true` — успех.
  Future<bool> submitEdit(String penaltyId, UpdatePenaltyInput input) {
    return _submit(
      () => _penaltyRepository.editPenalty(_orgId, penaltyId, input),
    );
  }

  Future<bool> _submit(Future<Task<Penalty>> Function() action) async {
    emit(
      state.copyWith(
        submitStatus: FeatureStatus.loading,
        submitError: null,
        submitErrorCode: null,
      ),
    );
    final result = await action();
    return result.fold(
      onSuccess: (_) {
        emit(state.copyWith(submitStatus: FeatureStatus.success));
        return true;
      },
      onFailure: (error) {
        emit(
          state.copyWith(
            submitStatus: FeatureStatus.error,
            submitError: error.message,
            submitErrorCode: error.code,
          ),
        );
        return false;
      },
    );
  }
}
