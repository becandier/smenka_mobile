part of '../view/geo_fallback_start_page.dart';

/// Живое превью камеры + кнопка спуска (`shift_geo_photo_fallback`).
///
/// Контроллер живёт в виджете, а не в кубите: у него собственный жизненный
/// цикл, привязанный к дереву (`initialize`/`dispose`), а кубит остаётся про
/// состояние флоу. Наружу уходит только снятый [XFile] — дальше его читает и
/// готовит `PhotoPickerService`, та же таксономия ошибок, что у всех фото.
///
/// Любой сбой инициализации/съёмки (нет доступа к камере, устройство занято)
/// переводит флоу на выбор файла через
/// [GeoFallbackStartCubit.onCameraUnavailable] — сотрудник не остаётся с
/// нерабочим экраном.
class _CameraCapture extends StatefulWidget {
  const _CameraCapture();

  @override
  State<_CameraCapture> createState() => _CameraCaptureState();
}

class _CameraCaptureState extends State<_CameraCapture> {
  CameraController? _controller;
  bool _initializing = true;
  bool _capturing = false;

  @override
  void initState() {
    super.initState();
    unawaited(_initCamera());
  }

  @override
  void dispose() {
    unawaited(_controller?.dispose());
    super.dispose();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) throw CameraException('NoCameras', 'no cameras');
      // Задняя камера, если она есть, — сотрудник снимает место, а не себя.
      final description = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = CameraController(
        description,
        ResolutionPreset.high,
        enableAudio: false,
      );
      await controller.initialize();
      if (!mounted) {
        unawaited(controller.dispose());
        return;
      }
      setState(() {
        _controller = controller;
        _initializing = false;
      });
    } on Object catch (error) {
      // `on Object`, а не `on Exception`: на web сюда прилетают JS-интероп
      // значения (DOMException от getUserMedia), которые не Dart Exception.
      if (!mounted) return;
      setState(() => _initializing = false);
      context.read<GeoFallbackStartCubit>().onCameraUnavailable(error);
    }
  }

  Future<void> _shoot() async {
    final controller = _controller;
    if (controller == null || _capturing) return;

    setState(() => _capturing = true);
    try {
      final shot = await controller.takePicture();
      if (!mounted) return;
      await context.read<GeoFallbackStartCubit>().attachShot(shot);
    } on Object catch (error) {
      if (!mounted) return;
      context.read<GeoFallbackStartCubit>().onCameraUnavailable(error);
    } finally {
      if (mounted) setState(() => _capturing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final controller = _controller;

    if (_initializing || controller == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height: 12),
            Text(
              l10n.geoFallbackCameraPreparing,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: context.appColors.muted),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: CameraPreview(controller),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.geoFallbackCameraHint,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: context.appColors.muted),
        ),
        const SizedBox(height: 12),
        AppButton(
          label: l10n.geoFallbackCameraShoot,
          isLoading: _capturing,
          onPressed: _shoot,
        ),
      ],
    );
  }
}
