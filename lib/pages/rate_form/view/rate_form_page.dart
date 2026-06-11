import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/data/domain/payroll/_payroll.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/rate_form/cubit/rate_form_cubit.dart';
import 'package:smenka_mobile/pages/rate_form/cubit/rate_form_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Модалка добавления/исправления ставки участника (org_admin).
/// Возвращает `true`, если мутация прошла успешно (история изменилась).
@RoutePage()
class RateFormPage extends StatelessWidget {
  const RateFormPage({
    required this.orgId,
    required this.memberId,
    this.initialRate,
    super.key,
  });

  final String orgId;
  final String memberId;

  /// Запись для исправления; null — добавление новой ставки.
  final Rate? initialRate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RateFormCubit(
        orgId: orgId,
        memberId: memberId,
        rateId: initialRate?.id,
        payrollRepository: context.read<PayrollRepository>(),
      ),
      child: _RateFormView(initialRate: initialRate),
    );
  }
}

class _RateFormView extends StatefulWidget {
  const _RateFormView({this.initialRate});

  final Rate? initialRate;

  @override
  State<_RateFormView> createState() => _RateFormViewState();
}

class _RateFormViewState extends State<_RateFormView> {
  static final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  late final TextEditingController _amountController;
  late final TextEditingController _noteController;
  late RateType _rateType;
  late DateTime _effectiveFromDay;
  String? _amountError;
  String? _dateError;

  /// Пользователь менял дату. Если нет — при исправлении отправляем
  /// исходный instant effective_from без пересчёта через локальную полночь
  /// (иначе момент действия молча сдвинулся бы на таймзону редактора).
  bool _dateDirty = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialRate;
    _amountController = TextEditingController(
      text: initial == null ? '' : _minorToRublesInput(initial.rateAmountMinor),
    );
    _noteController = TextEditingController(text: initial?.note ?? '');
    _rateType = initial?.rateType ?? RateType.hourly;
    final initialDay = (initial?.effectiveFrom ?? DateTime.now()).toLocal();
    _effectiveFromDay =
        DateTime(initialDay.year, initialDay.month, initialDay.day);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  /// Копейки → строка для поля ввода («180» / «180,50»), без double.
  String _minorToRublesInput(int amountMinor) {
    final rubles = amountMinor ~/ 100;
    final kopecks = amountMinor % 100;
    if (kopecks == 0) return rubles.toString();
    return '$rubles,${kopecks.toString().padLeft(2, '0')}';
  }

  Future<void> _pickEffectiveFrom() async {
    final now = DateTime.now();
    final firstDate = DateTime(2020);
    final lastDate = DateTime(now.year + 2, now.month, now.day);
    // Кламп: initialDate вне [firstDate, lastDate] роняет showDatePicker
    // на assert (например, очень старая ставка из истории).
    var initialDate = _effectiveFromDay;
    if (initialDate.isBefore(firstDate)) initialDate = firstDate;
    if (initialDate.isAfter(lastDate)) initialDate = lastDate;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked == null) return;
    setState(() {
      _effectiveFromDay = DateTime(picked.year, picked.month, picked.day);
      _dateDirty = true;
      _dateError = null;
    });
  }

  Future<void> _submit() async {
    final l10n = context.l10n;
    final amountMinor = parseRublesToMinor(_amountController.text);
    if (amountMinor == null || amountMinor <= 0) {
      setState(() => _amountError = l10n.errorValidation);
      return;
    }
    setState(() {
      _amountError = null;
      _dateError = null;
    });

    final cubit = context.read<RateFormCubit>();
    final note = _noteController.text.trim();
    final initialRate = widget.initialRate;
    // Дату не меняли при исправлении — шлём исходный instant как есть.
    final effectiveFromUtc = !_dateDirty && initialRate != null
        ? initialRate.effectiveFrom
        : _effectiveFromDay.toUtc();
    final ok = await cubit.submit(
      rateAmountMinor: amountMinor,
      rateType: _rateType,
      effectiveFromUtc: effectiveFromUtc,
      note: note.isEmpty ? null : note,
    );

    if (!mounted) return;
    if (ok) {
      await context.router.maybePop(true);
      return;
    }

    final state = cubit.state;
    if (state.isEffectiveFromTaken) {
      setState(() => _dateError = l10n.errorRateEffectiveFromTaken);
    } else {
      context.modals.showError(
        localizedErrorMessage(
          context,
          code: state.errorCode,
          fallback: state.errorMessage,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final isEdit = context.read<RateFormCubit>().isEdit;

    return BlocBuilder<RateFormCubit, RateFormState>(
      builder: (context, state) {
        return AppBottomSheet(
          title: isEdit ? l10n.payrollEditRate : l10n.payrollAddRate,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isEdit) ...[
                Text(
                  l10n.payrollEditRateHint,
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.secondary,
                  ),
                ),
                const SizedBox(height: 12),
              ],
              AppTextField(
                controller: _amountController,
                label: l10n.payrollRateAmountLabel,
                error: _amountError,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                enabled: !state.isSubmitting,
              ),
              const SizedBox(height: 16),
              SegmentedButton<RateType>(
                segments: [
                  ButtonSegment(
                    value: RateType.hourly,
                    label: Text(l10n.payrollRateHourly),
                  ),
                  ButtonSegment(
                    value: RateType.perShift,
                    label: Text(l10n.payrollRatePerShift),
                  ),
                ],
                selected: {_rateType},
                onSelectionChanged: state.isSubmitting
                    ? null
                    : (selection) =>
                        setState(() => _rateType = selection.first),
                showSelectedIcon: false,
              ),
              const SizedBox(height: 16),
              _DateField(
                label: l10n.payrollRateDateLabel,
                value: _dateFormat.format(_effectiveFromDay),
                error: _dateError,
                onTap: state.isSubmitting ? null : _pickEffectiveFrom,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _noteController,
                label: l10n.payrollRateNoteHint,
                enabled: !state.isSubmitting,
              ),
              const SizedBox(height: 24),
              AppButton(
                label: l10n.save,
                isLoading: state.isSubmitting,
                onPressed: _submit,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.value,
    this.error,
    this.onTap,
  });

  final String label;
  final String value;
  final String? error;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final errorText = error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: errorText != null
                  ? colors.error
                  : colors.secondary.withValues(alpha: 0.3),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                top: 12,
                bottom: 12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: textTheme.bodySmall?.copyWith(
                            color: colors.secondary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(value, style: textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: colors.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              errorText,
              style: textTheme.bodySmall?.copyWith(color: colors.error),
            ),
          ),
        ],
      ],
    );
  }
}
