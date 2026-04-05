import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/app/config/flavors.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/pages/debug/data/_data.dart';

part 'debug_cubit.freezed.dart';
part 'debug_state.dart';

class DebugCubit extends Cubit<DebugState> {
  DebugCubit({
    required DebugRepository debugRepository,
  })  : _debugRepository = debugRepository,
        super(const DebugState()) {
    _init();
  }

  final DebugRepository _debugRepository;

  Future<void> _init() async {
    await Future.wait([
      fetchFlavor(),
      fetchDeviceAccess(),
    ]);
  }

  Future<void> fetchFlavor() async {
    emit(
      state.copyWith(
        status: FeatureStatus.loading,
      ),
    );
    try {
      final flavor = await _debugRepository.getFlavor();
      emit(
        state.copyWith(
          flavor: flavor,
          status: FeatureStatus.success,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FeatureStatus.error,
        ),
      );
    }
  }

  Future<void> setFlavor(Flavors flavor) async {
    await _debugRepository.setFlavor(flavor);
    emit(
      state.copyWith(
        flavor: flavor,
        status: FeatureStatus.success,
      ),
    );
  }

  Future<void> fetchDeviceAccess() async {
    emit(
      state.copyWith(
        status: FeatureStatus.loading,
      ),
    );
    try {
      final isDeviceAccess = await _debugRepository.getDeviceAccess();
      emit(
        state.copyWith(
          isDeviceAccess: isDeviceAccess,
          status: FeatureStatus.success,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FeatureStatus.error,
        ),
      );
    }
  }

  Future<void> setDeviceAccess() async {
    await _debugRepository.setDeviceAccess();
    emit(
      state.copyWith(
        isDeviceAccess: true,
        status: FeatureStatus.success,
      ),
    );
  }
}
