part of '../view/geo_fallback_start_page.dart';

/// Шаг 3 — кадр.
///
/// Камера доступна → **только съёмка** in-app: выбора файла в UI нет. Файл
/// предлагается лишь когда камеры нет или доступ к ней не дали
/// (`GeoFallbackPhotoMode.file`) — решение владельца «мало ли человек с компа
/// сидит». Полагаться на `<input capture>` нельзя: на десктопе атрибут
/// игнорируется и открывается обычный файловый диалог.
class _PhotoStep extends StatelessWidget {
  const _PhotoStep({required this.state});

  final GeoFallbackStartState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StepTitle(l10n.geoFallbackPhotoStep),
        const SizedBox(height: 8),
        if (state.photoBytes case final bytes?)
          _PhotoPreview(bytes: bytes, isLocked: state.isSubmitting)
        else
          _PhotoSource(state: state),
        if (state.photoErrorCode case final code?) ...[
          const SizedBox(height: 8),
          Text(
            localizedErrorMessage(context, code: code),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: context.appColors.error),
          ),
        ],
      ],
    );
  }
}

/// Снятый/выбранный кадр + пересъёмка.
class _PhotoPreview extends StatelessWidget {
  const _PhotoPreview({required this.bytes, required this.isLocked});

  final Uint8List bytes;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Image.memory(bytes, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 12),
        AppButton(
          label: l10n.geoFallbackRetakePhoto,
          isOutlined: true,
          isEnabled: !isLocked,
          onPressed: () => context.read<GeoFallbackStartCubit>().clearPhoto(),
        ),
      ],
    );
  }
}

/// Источник кадра — определяется пробой камеры, а не выбором пользователя.
class _PhotoSource extends StatelessWidget {
  const _PhotoSource({required this.state});

  final GeoFallbackStartState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    if (state.photoProcessing) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height: 12),
            Text(
              l10n.geoFallbackPhotoProcessing,
              style: textTheme.bodySmall?.copyWith(color: colors.muted),
            ),
          ],
        ),
      );
    }

    return switch (state.photoMode) {
      GeoFallbackPhotoMode.unknown => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height: 12),
            Text(
              l10n.geoFallbackCameraPreparing,
              style: textTheme.bodySmall?.copyWith(color: colors.muted),
            ),
          ],
        ),
      ),
      GeoFallbackPhotoMode.camera => const _CameraCapture(),
      GeoFallbackPhotoMode.file => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.geoFallbackCameraUnavailable,
            style: textTheme.bodySmall?.copyWith(color: colors.muted),
          ),
          const SizedBox(height: 12),
          AppButton(
            label: l10n.geoFallbackPickFile,
            isOutlined: true,
            onPressed: () =>
                context.read<GeoFallbackStartCubit>().pickFromFile(),
          ),
        ],
      ),
    };
  }
}
