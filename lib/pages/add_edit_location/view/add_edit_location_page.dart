import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/app/config/app_config.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/location/models/_models.dart';
import 'package:smenka_mobile/data/domain/location/repositories/location_repository.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/add_edit_location/cubit/add_edit_location_cubit.dart';
import 'package:smenka_mobile/pages/add_edit_location/cubit/add_edit_location_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as yandex_init;
import 'package:yandex_maps_mapkit_lite/mapkit.dart' hide Icon;
import 'package:yandex_maps_mapkit_lite/yandex_map.dart';

part '../widgets/_center_marker.dart';
part '../widgets/_location_form.dart';

@RoutePage()
class AddEditLocationPage extends StatelessWidget {
  const AddEditLocationPage({
    required this.orgId,
    this.existingLocation,
    super.key,
  });

  final String orgId;
  final WorkLocation? existingLocation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddEditLocationCubit(
        orgId: orgId,
        locationRepository: context.read<LocationRepository>(),
        existingLocation: existingLocation,
      ),
      child: const _AddEditLocationView(),
    );
  }
}

class _AddEditLocationView extends StatefulWidget {
  const _AddEditLocationView();

  @override
  State<_AddEditLocationView> createState() => _AddEditLocationViewState();
}

class _AddEditLocationViewState extends State<_AddEditLocationView>
    implements MapCameraListener {
  MapWindow? _mapWindow;
  CircleMapObject? _circleMapObject;
  bool _mapInitialized = false;

  @override
  void dispose() {
    if (_mapWindow != null) {
      _mapWindow?.map.removeCameraListener(this);
    }
    super.dispose();
  }

  @override
  void onCameraPositionChanged(
    Map map,
    CameraPosition cameraPosition,
    CameraUpdateReason cameraUpdateReason,
    bool finished,
  ) {
    if (finished) {
      final target = cameraPosition.target;
      context
          .read<AddEditLocationCubit>()
          .updatePosition(target.latitude, target.longitude);
    }

    _updateCircle();
  }

  void _onMapCreated(MapWindow mapWindow) {
    _mapWindow = mapWindow;
    mapWindow.map.addCameraListener(this);

    final state = context.read<AddEditLocationCubit>().state;

    // Перемещаем камеру на начальную позицию
    mapWindow.map.move(
      CameraPosition(
        Point(latitude: state.latitude, longitude: state.longitude),
        zoom: 15,
        azimuth: 0,
        tilt: 0,
      ),
    );

    // Добавляем круг радиуса
    final circle = mapWindow.map.mapObjects.addCircle(
      Circle(
        Point(latitude: state.latitude, longitude: state.longitude),
        radius: state.radiusMeters.toDouble(),
      ),
    )
      ..strokeColor = Colors.blue.withValues(alpha: 0.8)
      ..strokeWidth = 2
      ..fillColor = Colors.blue.withValues(alpha: 0.15);
    _circleMapObject = circle;

    setState(() {
      _mapInitialized = true;
    });
  }

  void _updateCircle() {
    final state = context.read<AddEditLocationCubit>().state;
    final mapWindow = _mapWindow;
    if (mapWindow == null) return;

    final target = mapWindow.map.cameraPosition.target;

    _circleMapObject?.geometry = Circle(
      Point(latitude: target.latitude, longitude: target.longitude),
      radius: state.radiusMeters.toDouble(),
    );
  }

  void _updateCircleRadius(int radiusMeters) {
    final mapWindow = _mapWindow;
    if (mapWindow == null) return;

    final target = mapWindow.map.cameraPosition.target;

    _circleMapObject?.geometry = Circle(
      Point(latitude: target.latitude, longitude: target.longitude),
      radius: radiusMeters.toDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isEdit = context.select<AddEditLocationCubit, bool>(
      (cubit) => cubit.state.isEdit,
    );

    return BlocListener<AddEditLocationCubit, AddEditLocationState>(
      listenWhen: (prev, curr) => prev.radiusMeters != curr.radiusMeters,
      listener: (context, state) {
        _updateCircleRadius(state.radiusMeters);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEdit ? l10n.editLocationTitle : l10n.addLocationTitle),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            // Карта Yandex
            _YandexMapWidget(
              onMapCreated: _onMapCreated,
              apiKey: context.read<AppConfig>().yandexMapsApiKey,
            ),
            // Маркер по центру
            const _CenterMarker(),
            // Подсказка сверху
            if (_mapInitialized)
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.appColors.surface.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Text(
                        l10n.addLocationMoveMap,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              ),
            // Форма внизу
            _LocationForm(
              onRadiusChanged: _updateCircleRadius,
            ),
          ],
        ),
      ),
    );
  }
}

class _YandexMapWidget extends StatefulWidget {
  const _YandexMapWidget({
    required this.onMapCreated,
    required this.apiKey,
  });

  final void Function(MapWindow) onMapCreated;
  final String apiKey;

  @override
  State<_YandexMapWidget> createState() => _YandexMapWidgetState();
}

class _YandexMapWidgetState extends State<_YandexMapWidget> {
  bool _sdkInitialized = false;
  String? _initError;

  @override
  void initState() {
    super.initState();
    _initSdk();
  }

  Future<void> _initSdk() async {
    try {
      await yandex_init.initMapkit(apiKey: widget.apiKey);
      if (mounted) {
        setState(() {
          _sdkInitialized = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _initError = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_initError != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            _initError ?? '',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.appColors.error,
                ),
          ),
        ),
      );
    }

    if (!_sdkInitialized) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    return YandexMap(
      onMapCreated: widget.onMapCreated,
    );
  }
}
