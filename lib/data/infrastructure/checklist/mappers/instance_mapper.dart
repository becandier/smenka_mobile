import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/checklist/mappers/template_mapper.dart';

ChecklistInstanceStatus _parseStatus(String value) => switch (value) {
  'pending' => ChecklistInstanceStatus.pending,
  'completed' => ChecklistInstanceStatus.completed,
  'incomplete' => ChecklistInstanceStatus.incomplete,
  _ => throw ArgumentError('Unknown checklist instance status: $value'),
};

extension ChecklistItemsSummaryDtoMapper on ChecklistItemsSummaryDto {
  ChecklistItemsSummary toDomain() =>
      ChecklistItemsSummary(total: total, completed: completed);
}

extension ChecklistInstanceDtoMapper on ChecklistInstanceDto {
  ChecklistInstance toDomain() => ChecklistInstance(
    id: id,
    name: name,
    type: checklistTypeFromApi(type),
    isRequired: isRequired,
    status: _parseStatus(status),
    itemsSummary: itemsSummary.toDomain(),
    completedAt: completedAt,
    createdAt: createdAt,
  );
}

extension ChecklistInstanceItemDtoMapper on ChecklistInstanceItemDto {
  ChecklistInstanceItem toDomain() => ChecklistInstanceItem(
    id: id,
    text: text,
    isRequired: isRequired,
    position: position,
    isCompleted: isCompleted,
    comment: comment,
    completedAt: completedAt,
    changeCount: changeCount,
  );
}

extension ChecklistInstanceDetailDtoMapper on ChecklistInstanceDetailDto {
  ChecklistInstanceDetail toDomain() => ChecklistInstanceDetail(
    id: id,
    name: name,
    type: checklistTypeFromApi(type),
    isRequired: isRequired,
    status: _parseStatus(status),
    completedAt: completedAt,
    createdAt: createdAt,
    items: items.map((e) => e.toDomain()).toList(),
  );
}
