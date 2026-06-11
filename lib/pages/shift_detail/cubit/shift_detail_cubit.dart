import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/pages/shift_detail/cubit/shift_detail_state.dart';

class ShiftDetailCubit extends Cubit<ShiftDetailState> {
  ShiftDetailCubit({required Shift shift})
    : super(ShiftDetailState(shift: shift));
}
