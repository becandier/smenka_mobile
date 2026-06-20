import 'package:smenka_mobile/data/domain/checklist/models/_models.dart';

/// Кодек `ChecklistType` ↔ API-строка. Используется мапперами эффективных
/// шаблонов и экземпляров чек-листов смены (instance/effective_template).
String _checklistTypeApi(ChecklistType t) => switch (t) {
  ChecklistType.shiftStart => 'shift_start',
  ChecklistType.shiftEnd => 'shift_end',
};

extension ChecklistTypeCodec on ChecklistType {
  String toApi() => _checklistTypeApi(this);
}

ChecklistType checklistTypeFromApi(String value) =>
    ChecklistType.values.firstWhere((e) => _checklistTypeApi(e) == value);
