import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smenka_mobile/data/domain/checklist/models/checklist_template.dart';

part 'member_override.freezed.dart';

enum ChecklistOverrideType { add, remove }

@freezed
abstract class ChecklistMemberOverride with _$ChecklistMemberOverride {
  const factory ChecklistMemberOverride({
    required String templateId,
    required ChecklistOverrideType type,
  }) = _ChecklistMemberOverride;
}

@freezed
abstract class MemberChecklistOverride with _$MemberChecklistOverride {
  const factory MemberChecklistOverride({
    required String templateId,
    required String templateName,
    required ChecklistType templateType,
    required ChecklistOverrideType type,
  }) = _MemberChecklistOverride;
}
