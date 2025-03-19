import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:templatecmd/data/entity/azkar.dart';
import 'package:templatecmd/data/repository/azkar/azkar_repository.dart';

part 'azkar_state.dart';
part 'azkar_cubit.freezed.dart';

class AzkarsCubit extends Cubit<AzkarsState> {
  AzkarsCubit({
    required AzkarRepository azkarRepository,
  })  : _azkarRepository = azkarRepository,
        super(AzkarsState.loading()) {
    init();
  }
  final AzkarRepository _azkarRepository;

  Future<void> init() async {
    try {
      emit(AzkarsState.loading());
      final azkars = await _azkarRepository.getAzkar();
      emit(AzkarsState.success(azkars: azkars));
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
