import 'package:bloc/bloc.dart';
import 'package:templatecmd/core/bloc/error_handler_mixin.dart';
import 'package:templatecmd/core/constants/feature_statuses.dart';

/// Базовый класс для кубитов с Freezed-состояниями
abstract class BaseFreezedCubit<T> extends Cubit<T> with ErrorHandlerMixin<T> {
  BaseFreezedCubit(super.initialState);

  /// Обновляет состояние с новым статусом
  void updateStatus(FeatureStatus status);

  /// Обновляет состояние с новым сообщением об ошибке
  void updateErrorMessage(String? errorMessage);

  /// Обновляет состояние с новыми ошибками валидации
  void updateErrors(Map<String, String?>? errors);

  /// Выполняет действие с обработкой ошибок
  Future<void> execute({
    required Future<void> Function() call,
    void Function()? onSuccess,
    void Function(Object error)? onError,
  }) async {
    return safeCall(
      call: call,
      updateStatus: updateStatus,
      updateErrorMessage: updateErrorMessage,
      updateErrors: updateErrors,
      onSuccess: onSuccess,
      onError: onError,
    );
  }
}
