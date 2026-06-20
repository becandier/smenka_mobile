import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

sealed class GeoResult {
  const GeoResult();
}

class GeoSuccess extends GeoResult {
  const GeoSuccess({
    required this.latitude,
    required this.longitude,
    required this.lowAccuracy,
  });

  final double latitude;
  final double longitude;
  final bool lowAccuracy;
}

class GeoServiceDisabled extends GeoResult {
  const GeoServiceDisabled();
}

class GeoDenied extends GeoResult {
  const GeoDenied();
}

class GeoDeniedForever extends GeoResult {
  const GeoDeniedForever();
}

class GeoError extends GeoResult {
  const GeoError(this.message);
  final String message;
}

class GeoService {
  /// Точность ниже этого порога (в метрах) считается низкой.
  static const _lowAccuracyThreshold = 100.0;

  Future<GeoResult> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return const GeoServiceDisabled();

    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const GeoDenied();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return const GeoDeniedForever();
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 15),
        ),
      );

      return GeoSuccess(
        latitude: position.latitude,
        longitude: position.longitude,
        lowAccuracy: position.accuracy > _lowAccuracyThreshold,
      );
    } on Exception catch (e) {
      return GeoError(e.toString());
    }
  }

  /// Открытие системных настроек приложения.
  /// На web системных настроек нет — Geolocator кинул бы ошибку, поэтому no-op.
  Future<void> openAppSettings() async {
    if (kIsWeb) return;
    await Geolocator.openAppSettings();
  }

  /// Открытие системных настроек геолокации.
  /// На web недоступно — no-op.
  Future<void> openLocationSettings() async {
    if (kIsWeb) return;
    await Geolocator.openLocationSettings();
  }
}
