import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/core/utils/money_format.dart';
import 'package:smenka_mobile/data/domain/penalty/_penalty.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/penalty_form/cubit/penalty_form_cubit.dart';
import 'package:smenka_mobile/pages/penalty_form/cubit/penalty_form_state.dart';
import 'package:smenka_mobile/pages/shift_picker/_shift_picker.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

enum _PenaltySource { template, custom }

/// Модалка «Назначить / Исправить штраф» (admin/owner).
///
/// Открывается с `member_detail` (назначение) и с `OrgShiftDetailPage`
/// (быстрое «Оштрафовать» с предзаполнением [shiftId]/[initialOccurredAt]).
/// Передача [penalty] переводит форму в режим исправления (`PATCH`).
/// Возвращает `true` при успешной мутации.
@RoutePage()
class PenaltyFormPage extends StatelessWidget {
  const PenaltyFormPage({
    required this.orgId,
    required this.memberId,
    required this.userId,
    required this.userName,
    this.shiftId,
    this.initialOccurredAt,
    this.penalty,
    super.key,
  });

  final String orgId;
  final String memberId;
  final String userId;
  final String userName;
  final String? shiftId;
  final DateTime? initialOccurredAt;
  final Penalty? penalty;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PenaltyFormCubit(
        orgId: orgId,
        penaltyRepository: context.read<PenaltyRepository>(),
      ),
      child: _PenaltyFormView(
        orgId: orgId,
        memberId: memberId,
        userId: userId,
        userName: userName,
        shiftId: shiftId,
        initialOccurredAt: initialOccurredAt,
        penalty: penalty,
      ),
    );
  }
}

class _PenaltyFormView extends StatefulWidget {
  const _PenaltyFormView({
    required this.orgId,
    required this.memberId,
    required this.userId,
    required this.userName,
    required this.shiftId,
    required this.initialOccurredAt,
    required this.penalty,
  });

  final String orgId;
  final String memberId;
  final String userId;
  final String userName;
  final String? shiftId;
  final DateTime? initialOccurredAt;
  final Penalty? penalty;

  @override
  State<_PenaltyFormView> createState() => _PenaltyFormViewState();
}

class _PenaltyFormViewState extends State<_PenaltyFormView> {
  late final TextEditingController _reasonController;
  late final TextEditingController _amountController;
  late final TextEditingController _commentController;

  _PenaltySource _source = _PenaltySource.custom;
  PenaltyTemplate? _selectedTemplate;
  String? _shiftId;

  /// Момент штрафа (UTC). null — не выбран.
  DateTime? _occurredAt;

  String? _reasonError;
  String? _amountError;
  String? _dateError;

  bool get _isEdit => widget.penalty != null;

  @override
  void initState() {
    super.initState();
    final penalty = widget.penalty;
    _reasonController = TextEditingController(text: penalty?.reason ?? '');
    _amountController = TextEditingController(
      text: penalty != null ? _minorToRublesInput(penalty.amountMinor) : '',
    );
    _commentController = TextEditingController(text: penalty?.comment ?? '');
    _shiftId = penalty?.shiftId ?? widget.shiftId;
    _occurredAt = penalty?.occurredAt ?? widget.initialOccurredAt;
  }

  @override
  void dispose() {
    _reasonController.dispose();
    _amountController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _onTemplateSelected(PenaltyTemplate? template) {
    setState(() {
      _selectedTemplate = template;
      if (template != null) {
        _reasonController.text = template.reason;
        _amountController.text = _minorToRublesInput(template.amountMinor);
        _reasonError = null;
        _amountError = null;
      }
    });
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _occurredAt?.toLocal() ?? now,
      firstDate: DateTime(2020),
      lastDate: now,
    );
    if (!mounted || picked == null) return;
    setState(() {
      // Выбранный локальный день → UTC начала дня (как `date_from`).
      _occurredAt = DateTime(picked.year, picked.month, picked.day).toUtc();
      _dateError = null;
    });
  }

  Future<void> _pickShift() async {
    final result = await context.router.push<ShiftPickerResult?>(
      ShiftPickerRoute(
        orgId: widget.orgId,
        userId: widget.userId,
        selectedShiftId: _shiftId,
      ),
    );
    if (!mounted || result == null) return;
    setState(() => _shiftId = result.shift?.id);
  }

  Future<void> _submit() async {
    final l10n = context.l10n;
    final reason = _reasonController.text.trim();
    final amountMinor = parseRublesToMinor(_amountController.text);

    var hasError = false;
    String? reasonError;
    String? amountError;
    String? dateError;

    if (reason.isEmpty || reason.length > 200) {
      reasonError = l10n.finesReasonInvalid;
      hasError = true;
    }
    if (amountMinor == null || amountMinor <= 0) {
      amountError = l10n.finesAmountInvalid;
      hasError = true;
    }
    if (_shiftId == null && _occurredAt == null) {
      dateError = l10n.finesDateRequired;
      hasError = true;
    }

    if (hasError) {
      setState(() {
        _reasonError = reasonError;
        _amountError = amountError;
        _dateError = dateError;
      });
      return;
    }

    setState(() {
      _reasonError = null;
      _amountError = null;
      _dateError = null;
    });

    final cubit = context.read<PenaltyFormCubit>();
    final comment = _commentController.text.trim();
    final penalty = widget.penalty;

    final bool ok;
    if (penalty == null) {
      ok = await cubit.submitCreate(
        CreatePenaltyInput(
          memberId: widget.memberId,
          reason: reason,
          // amountMinor валиден (проверено выше), но parse возвращает int?.
          amountMinor: amountMinor ?? 0,
          templateId: _source == _PenaltySource.template
              ? _selectedTemplate?.id
              : null,
          shiftId: _shiftId,
          occurredAt: _occurredAt,
          comment: comment.isEmpty ? null : comment,
        ),
      );
    } else {
      ok = await cubit.submitEdit(
        penalty.id,
        UpdatePenaltyInput(
          reason: reason,
          amountMinor: amountMinor ?? 0,
          shiftId: _shiftId,
          occurredAt: _occurredAt,
          comment: comment.isEmpty ? null : comment,
        ),
      );
    }

    if (!mounted) return;

    if (ok) {
      await context.router.maybePop(true);
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
    final occurredAt = _occurredAt;
    final occurredLabel = occurredAt == null
        ? null
        : DateFormat('dd.MM.yyyy').format(occurredAt.toLocal());

    return AppBottomSheet(
      title: _isEdit ? l10n.finesEdit : l10n.finesAssign,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.userName,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: context.appColors.secondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          if (!_isEdit) ...[
            _SourceSelector(
              source: _source,
              onChanged: (source) => setState(() => _source = source),
            ),
            const SizedBox(height: 12),
            if (_source == _PenaltySource.template) ...[
              _TemplateSelector(
                selected: _selectedTemplate,
                onSelected: _onTemplateSelected,
              ),
              const SizedBox(height: 12),
            ],
          ],
          AppTextField(
            controller: _reasonController,
            label: l10n.finesFieldReason,
            error: _reasonError,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _amountController,
            label: l10n.finesFieldAmount,
            error: _amountError,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
            ],
          ),
          const SizedBox(height: 12),
          _PickerField(
            label: l10n.finesFieldShift,
            value: _shiftId == null ? null : l10n.finesAttachedToShift,
            placeholder: l10n.finesShiftNone,
            onTap: _pickShift,
          ),
          const SizedBox(height: 12),
          _PickerField(
            label: l10n.finesFieldDate,
            value: occurredLabel,
            placeholder: _shiftId == null
                ? l10n.finesDateRequiredHint
                : l10n.finesDateFromShift,
            error: _dateError,
            onTap: _pickDate,
          ),
          const SizedBox(height: 12),
          AppTextField(
            controller: _commentController,
            label: l10n.finesFieldComment,
          ),
          if (_isEdit) ...[
            const SizedBox(height: 8),
            Text(
              l10n.finesEditHint,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: context.appColors.secondary,
              ),
            ),
          ],
          const SizedBox(height: 20),
          BlocSelector<PenaltyFormCubit, PenaltyFormState, bool>(
            selector: (state) => state.isSubmitting,
            builder: (context, isSubmitting) {
              return AppButton(
                label: _isEdit ? l10n.save : l10n.finesAssign,
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

/// Сегмент-контрол «Из шаблона / Свой».
class _SourceSelector extends StatelessWidget {
  const _SourceSelector({required this.source, required this.onChanged});

  final _PenaltySource source;
  final ValueChanged<_PenaltySource> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SegmentedButton<_PenaltySource>(
      segments: [
        ButtonSegment(
          value: _PenaltySource.template,
          label: Text(l10n.finesSourceTemplate),
        ),
        ButtonSegment(
          value: _PenaltySource.custom,
          label: Text(l10n.finesSourceCustom),
        ),
      ],
      selected: {source},
      showSelectedIcon: false,
      onSelectionChanged: (selection) {
        final value = selection.firstOrNull;
        if (value != null) onChanged(value);
      },
    );
  }
}

/// Выпадающий список активных шаблонов штрафов.
class _TemplateSelector extends StatelessWidget {
  const _TemplateSelector({required this.selected, required this.onSelected});

  final PenaltyTemplate? selected;
  final ValueChanged<PenaltyTemplate?> onSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;

    return BlocBuilder<PenaltyFormCubit, PenaltyFormState>(
      buildWhen: (prev, curr) => prev.templates != curr.templates,
      builder: (context, state) {
        final section = state.templates;

        if (section.status == FeatureStatus.loading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        }

        if (section.error case final message?) {
          return Text(
            localizedErrorMessage(
              context,
              code: section.errorCode,
              fallback: message,
            ),
            style: TextStyle(color: colors.error),
          );
        }

        final templates = section.data ?? const <PenaltyTemplate>[];
        if (templates.isEmpty) {
          return Text(
            l10n.finesTemplateEmpty,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: colors.secondary),
          );
        }

        return DropdownButtonFormField<PenaltyTemplate>(
          initialValue: selected,
          isExpanded: true,
          decoration: InputDecoration(labelText: l10n.finesTemplatePick),
          items: templates.map((template) {
            final amount = formatMoneyMinor(template.amountMinor);
            return DropdownMenuItem(
              value: template,
              child: Text(
                '${template.reason} · $amount',
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onSelected,
        );
      },
    );
  }
}

/// Поле-кнопка (смена/дата): открывает модалку выбора по тапу.
class _PickerField extends StatelessWidget {
  const _PickerField({
    required this.label,
    required this.value,
    required this.placeholder,
    required this.onTap,
    this.error,
  });

  final String label;
  final String? value;
  final String placeholder;
  final String? error;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final shownValue = value;
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                        Text(
                          shownValue ?? placeholder,
                          style: textTheme.bodyLarge?.copyWith(
                            color: shownValue == null ? colors.secondary : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: colors.secondary),
                ],
              ),
            ),
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText,
            style: textTheme.bodySmall?.copyWith(color: colors.error),
          ),
        ],
      ],
    );
  }
}

/// `1234567` (копейки) → `12345,67` для редактируемого поля ввода рублей.
String _minorToRublesInput(int minor) {
  final rubles = minor ~/ 100;
  final kopecks = minor % 100;
  if (kopecks == 0) return '$rubles';
  return '$rubles,${kopecks.toString().padLeft(2, '0')}';
}
