// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedShiftsDto _$PaginatedShiftsDtoFromJson(Map<String, dynamic> json) =>
    _PaginatedShiftsDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => ShiftDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
    );

Map<String, dynamic> _$PaginatedShiftsDtoToJson(_PaginatedShiftsDto instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
    };
