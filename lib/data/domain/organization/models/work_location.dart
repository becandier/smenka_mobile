import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_location.freezed.dart';

/// Рабочая точка организации в компактном виде `{id, name, address}`.
///
/// Используется в двух местах: список точек org для выбора при старте смены
/// (`GET /organizations/{org_id}/locations`) и вложенный объект
/// `work_location` в ответах со сменой. Гео-поля (lat/lng/radius) на клиенте
/// сейчас не нужны — выбор точки без карты, поэтому модель компактная.
@freezed
abstract class WorkLocation with _$WorkLocation {
  const factory WorkLocation({
    required String id,
    required String name,
    String? address,
  }) = _WorkLocation;
}
