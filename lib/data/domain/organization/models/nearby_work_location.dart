import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_work_location.freezed.dart';

/// Рабочая точка организации, попадающая в радиус координат сотрудника —
/// элемент ответа `GET /organizations/{org_id}/work-locations/nearby`
/// (`shift_start_location_choice`). Гео-поля (lat/lng/radius) на клиенте не
/// нужны — выбор точки без карты (вне scope), поэтому модель компактная.
@freezed
abstract class NearbyWorkLocation with _$NearbyWorkLocation {
  const factory NearbyWorkLocation({
    required String id,
    required String name,

    /// Расстояние до точки, метры (округление вниз, отдаёт сервер).
    required int distanceMeters,

    /// `true` — ближайшая из подходящих; ровно у одного элемента списка (у
    /// первого, сервер уже сортирует по [distanceMeters]).
    required bool isNearest,
    String? address,
  }) = _NearbyWorkLocation;
}

/// Ближайшая точка организации ВНЕ радиуса — заполняется сервером, когда
/// сотрудник не попал ни в одну зону (`items` пуст), чтобы подсказать
/// «До ближайшей точки «Офис» ~320 м».
@freezed
abstract class NearestOutsideWorkLocation with _$NearestOutsideWorkLocation {
  const factory NearestOutsideWorkLocation({
    required String name,
    required int distanceMeters,
  }) = _NearestOutsideWorkLocation;
}

/// Ответ `work-locations/nearby` целиком.
@freezed
abstract class NearbyWorkLocations with _$NearbyWorkLocations {
  const factory NearbyWorkLocations({
    /// Точки в радиусе, отсортированные по возрастанию расстояния — порядок
    /// сервера, клиент не пересортировывает (mobile.md).
    required List<NearbyWorkLocation> items,

    /// `null` — у организации нет точек вне [items] (либо [items] не пуст).
    NearestOutsideWorkLocation? nearestOutside,
  }) = _NearbyWorkLocations;
}
