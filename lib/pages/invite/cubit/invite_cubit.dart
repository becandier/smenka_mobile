import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/core/deep_link/pending_invite_storage.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/web/url_strategy.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';

part 'invite_cubit.freezed.dart';
part 'invite_state.dart';

/// Единая точка обработки ссылки-приглашения `/invite/{code}` — одна и та же
/// логика для web (маршрут срабатывает сам по себе) и native (код приходит
/// либо из этого же маршрута, либо из `DeepLinkService`/`PendingInviteStorage`
/// через `success_app.dart`).
class InviteCubit extends Cubit<InviteState> {
  InviteCubit({
    required this.code,
    required OrganizationRepository organizationRepository,
    required PendingInviteStorage pendingInviteStorage,
    required AuthStateNotifier authNotifier,
  }) : _organizationRepository = organizationRepository,
       _pendingInviteStorage = pendingInviteStorage,
       _authNotifier = authNotifier,
       super(const InviteState.loading()) {
    _start();
  }

  final String code;
  final OrganizationRepository _organizationRepository;
  final PendingInviteStorage _pendingInviteStorage;
  final AuthStateNotifier _authNotifier;

  Future<void> _start() async {
    if (!_authNotifier.isAuthenticated) {
      // Код должен пережить логин/регистрацию: сохраняем ДО того, как
      // сигнализируем экрану уйти на логин (см. requiresAuth в view) — иначе
      // возможна гонка между навигацией и записью в SharedPreferences.
      await _pendingInviteStorage.save(code);
      emit(const InviteState.requiresAuth());
      return;
    }
    await _join();
  }

  /// Повторить попытку — имеет смысл только для [InviteErrorKind.network],
  /// остальные коды финальны (см. кнопки в view).
  Future<void> retry() => _join();

  Future<void> _join() async {
    emit(const InviteState.loading());
    final result = await _organizationRepository.join(code);

    result.fold(
      onSuccess: (joinResult) {
        emit(
          InviteState.success(organizationName: joinResult.organizationName),
        );
        _markProcessed();
      },
      onFailure: (error) {
        final kind = _kindOf(error);
        emit(InviteState.error(kind: kind, message: error.message));
        // Сетевую ошибку оставляем повторяемой — URL не чистим, чтобы и
        // ручной retry, и обычный F5 могли попытаться ещё раз.
        if (kind != InviteErrorKind.network) {
          _markProcessed();
        }
      },
    );
  }

  InviteErrorKind _kindOf(ApiException error) => switch (error.code) {
    'INVALID_INVITE' => InviteErrorKind.invalidInvite,
    'OWNER_CANNOT_JOIN' => InviteErrorKind.ownerCannotJoin,
    'ALREADY_MEMBER' => InviteErrorKind.alreadyMember,
    _ => InviteErrorKind.network,
  };

  /// Идемпотентность на web: как только код обработан окончательно (успех
  /// либо один из трёх известных кодов ошибки), чистим адресную строку на
  /// `/` через `history.replaceState` — БЕЗ навигации роутера, сам экран
  /// продолжает показывать результат. Так перезагрузка страницы (F5) не
  /// повторяет `join` — браузер откроет `/`, а не `/invite/{code}`.
  /// На нативе `replaceBrowserPath` — no-op (нет адресной строки).
  void _markProcessed() => replaceBrowserPath('/');
}
