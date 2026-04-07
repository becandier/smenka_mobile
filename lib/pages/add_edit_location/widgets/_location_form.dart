part of '../view/add_edit_location_page.dart';

class _LocationForm extends StatefulWidget {
  const _LocationForm({
    required this.onRadiusChanged,
  });

  final void Function(int radiusMeters) onRadiusChanged;

  @override
  State<_LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<_LocationForm> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AddEditLocationCubit>();
    _nameController = TextEditingController(text: cubit.state.name);
    _nameController.addListener(_onNameChanged);
  }

  @override
  void dispose() {
    _nameController
      ..removeListener(_onNameChanged)
      ..dispose();
    super.dispose();
  }

  void _onNameChanged() {
    context.read<AddEditLocationCubit>().updateName(_nameController.text);
  }

  Future<void> _onSave() async {
    final cubit = context.read<AddEditLocationCubit>();
    final success = await cubit.save();
    if (!mounted) return;

    if (success) {
      context.modals.showSuccess(context.l10n.addLocationSaved);
      await context.maybePop(true);
    } else {
      final error = cubit.state.saveError;
      if (error != null) {
        context.modals.showError(error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 20,
              bottom: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppTextField(
                  controller: _nameController,
                  label: l10n.addLocationName,
                  hint: l10n.addLocationNameHint,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 16),
                BlocSelector<AddEditLocationCubit, AddEditLocationState, int>(
                  selector: (state) => state.radiusMeters,
                  builder: (context, radiusMeters) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.addLocationRadius(radiusMeters),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Slider(
                          value: radiusMeters.toDouble(),
                          min: 50,
                          max: 500,
                          divisions: 18,
                          label: '$radiusMeters',
                          onChanged: (value) {
                            final newRadius = value.round();
                            context
                                .read<AddEditLocationCubit>()
                                .updateRadius(newRadius);
                            widget.onRadiusChanged(newRadius);
                          },
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 12),
                BlocBuilder<AddEditLocationCubit, AddEditLocationState>(
                  builder: (context, state) {
                    return AppButton(
                      onPressed: _onSave,
                      label: l10n.save,
                      isLoading: state.saveStatus == FeatureStatus.loading,
                      isEnabled: state.isValid,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
