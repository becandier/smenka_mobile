import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';

/// Разово решает, нужно ли авто-открыть страницу организации при заходе на
/// таб «Организации», минуя список.
///
/// Срабатывает не более одного раза за время жизни экземпляра: как только
/// [resolve] вернёт id организации, флаг [handled] становится `true`
/// навсегда и дальнейшие вызовы (в том числе pull-to-refresh или повторные
/// эмиты кубита) возвращают `null`, не вызывая повторного авто-открытия.
class SingleOrgAutoOpenGuard {
  bool _handled = false;

  /// `true`, если авто-открытие уже произошло (или условия для него не
  /// возникали, но проверка уже была разрешена сработать).
  bool get handled => _handled;

  /// Возвращает id организации, которую нужно открыть, либо `null`, если
  /// открывать не нужно: раздел ещё не загружен успешно, организаций не
  /// ровно одна, либо авто-открытие уже произошло ранее.
  String? resolve(SectionData<List<Organization>> section) {
    if (_handled || !section.isSuccess) return null;

    final orgs = section.data;
    if (orgs == null || orgs.length != 1) return null;

    _handled = true;
    return orgs.single.id;
  }
}
