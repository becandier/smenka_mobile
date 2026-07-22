import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/overtime_request/cubit/overtime_request_cubit.dart';
import 'package:smenka_mobile/pages/overtime_request/cubit/overtime_request_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

const _presets = [15, 30, 60];

/// Модалка «Добавить переработку» на завершённой смене (ТЗ п.3): пресеты
/// 15/30/60 мин + ручной ввод (1–1440) и обязательный комментарий. Возвращает
/// созданную [ShiftOvertimeRequest] при успехе.
@RoutePage()
class OvertimeRequestPage extends StatelessWidget {
  const OvertimeRequestPage({required this.shiftId, super.key});

  final String shiftId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OvertimeRequestCubit(
        shiftId: shiftId,
        shiftRepository: context.read<ShiftRepository>(),
      ),
      child: const _OvertimeRequestView(),
    );
  }
}

class _OvertimeRequestView extends StatefulWidget {
  const _OvertimeRequestView();

  @override
  State<_OvertimeRequestView> createState() => _OvertimeRequestViewState();
}

class _OvertimeRequestViewState extends State<_OvertimeRequestView> {
  late final TextEditingController _minutesController;
  late final TextEditingController _commentController;

  int? _selectedPreset;
  String? _minutesError;
  String? _commentError;

  @override
  void initState() {
    super.initState();
    _minutesController = TextEditingController();
    _commentController = TextEditingController();
    _minutesController.addListener(_onMinutesEdited);
  }

  @override
  void dispose() {
    _minutesController
      ..removeListener(_onMinutesEdited)
      ..dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _onMinutesEdited() {
    final typed = int.tryParse(_minutesController.text.trim());
    if (typed != _selectedPreset && mounted) {
      setState(() => _selectedPreset = typed == null ? _selectedPreset : null);
    }
  }

  void _pickPreset(int minutes) {
    setState(() {
      _selectedPreset = minutes;
      _minutesController.text = minutes.toString();
      _minutesError = null;
    });
  }

  Future<void> _submit() async {
    final l10n = context.l10n;
    final minutes = int.tryParse(_minutesController.text.trim());
    final comment = _commentController.text.trim();

    var hasError = false;
    String? minutesError;
    String? commentError;
    if (minutes == null || minutes < 1 || minutes > 1440) {
      minutesError = l10n.overtimeMinutesInvalid;
      hasError = true;
    }
    if (comment.isEmpty) {
      commentError = l10n.overtimeCommentRequired;
      hasError = true;
    }

    if (hasError) {
      setState(() {
        _minutesError = minutesError;
        _commentError = commentError;
      });
      return;
    }
    setState(() {
      _minutesError = null;
      _commentError = null;
    });

    final cubit = context.read<OvertimeRequestCubit>();
    final request = await cubit.submit(minutes: minutes ?? 0, comment: comment);

    if (!mounted) return;

    if (request != null) {
      await context.router.maybePop(request);
      return;
    }

    final state = cubit.state;
    context.modals.showError(
      localizedErrorMessage(
        context,
        code: state.submitErrorCode,
        fallback: state.submitError,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBottomSheet(
      title: l10n.overtimeFormTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final preset in _presets)
                ChoiceChip(
                  label: Text(l10n.overtimeMinutesPreset(preset)),
                  selected: _selectedPreset == preset,
                  onSelected: (_) => _pickPreset(preset),
                ),
            ],
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _minutesController,
            label: l10n.overtimeMinutesLabel,
            error: _minutesError,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _commentController,
            label: l10n.overtimeCommentLabel,
            error: _commentError,
          ),
          const SizedBox(height: 20),
          BlocSelector<OvertimeRequestCubit, OvertimeRequestState, bool>(
            selector: (state) => state.isSubmitting,
            builder: (context, isSubmitting) {
              return AppButton(
                label: l10n.overtimeSubmit,
                isLoading: isSubmitting,
                onPressed: _submit,
              );
            },
          ),
        ],
      ),
    );
  }
}
