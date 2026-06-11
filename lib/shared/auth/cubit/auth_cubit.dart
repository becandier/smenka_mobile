import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/auth/models/auth_state.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/data/domain/organization/repositories/organization_repository.dart';
import 'package:smenka_mobile/shared/auth/cubit/auth_state.dart' as cubit;

class AuthCubit extends Cubit<cubit.AuthCubitState> {
  AuthCubit({
    required AuthRepository authRepository,
    required AuthStateNotifier authNotifier,
    required OrganizationRepository organizationRepository,
  }) : _authRepository = authRepository,
       _authNotifier = authNotifier,
       _organizationRepository = organizationRepository,
       super(const cubit.AuthCubitState.unknown()) {
    _authNotifier.addListener(_onAuthStateChanged);
    _syncState();
  }

  final AuthRepository _authRepository;
  final AuthStateNotifier _authNotifier;
  final OrganizationRepository _organizationRepository;

  void _onAuthStateChanged() => _syncState();

  void _syncState() {
    final authState = _authNotifier.state;
    switch (authState) {
      case AuthStateAuthenticated():
        emit(const cubit.AuthCubitState.authenticated());
      case AuthStateUnauthenticated():
        emit(const cubit.AuthCubitState.unauthenticated());
      case AuthStateUnknown():
        emit(const cubit.AuthCubitState.unknown());
    }
  }

  Future<void> logout() async {
    _organizationRepository.clearCache();
    await _authRepository.logout();
  }

  @override
  Future<void> close() {
    _authNotifier.removeListener(_onAuthStateChanged);
    return super.close();
  }
}
