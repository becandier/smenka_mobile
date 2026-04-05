import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_location.freezed.dart';

@freezed
abstract class WorkLocation with _$WorkLocation {
  const factory WorkLocation({
    required String id,
    required String organizationId,
    required String name,
    required double latitude,
    required double longitude,
    required int radiusMeters,
    required DateTime createdAt,
  }) = _WorkLocation;
}
