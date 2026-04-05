import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_result.freezed.dart';

/// Результат регистрации — возвращает user_id и сообщение
@freezed
abstract class RegisterResult with _$RegisterResult {
  const factory RegisterResult({
    required String userId,
    required String message,
  }) = _RegisterResult;
}
