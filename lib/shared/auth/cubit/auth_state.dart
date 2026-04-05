import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthCubitState with _$AuthCubitState {
  const factory AuthCubitState.authenticated() = AuthCubitAuthenticated;
  const factory AuthCubitState.unauthenticated() = AuthCubitUnauthenticated;
  const factory AuthCubitState.unknown() = AuthCubitUnknown;
}
