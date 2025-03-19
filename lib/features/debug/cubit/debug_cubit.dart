import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:templatecmd/app/config/flavors.dart';
import 'package:templatecmd/features/debug/data/_data.dart';

part 'debug_cubit.freezed.dart';
part 'debug_state.dart';

class DebugCubit extends Cubit<DebugState> {
  DebugCubit({
    required DebugRepository debugRepository,
  })  : _debugRepository = debugRepository,
        super(const DebugState.initial());

  final DebugRepository _debugRepository;

  Future<void> fetchFlavor() async {
    emit(const DebugState.loading());
    try {
      final flavor = await _debugRepository.getFlavor();
      emit(DebugState.success(flavor));
    } on Exception catch (e) {
      emit(DebugState.error(e.toString()));
    }
  }

  Future<void> setFlavor(Flavors flavor) async {
    await _debugRepository.setFlavor(flavor);
    emit(DebugState.success(flavor));
  }
}
