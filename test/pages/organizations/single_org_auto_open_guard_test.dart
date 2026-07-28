import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/pages/organizations/view/single_org_auto_open_guard.dart';

Organization _org({required String id}) => Organization(
  id: id,
  name: 'Org $id',
  ownerId: 'owner-1',
  inviteCode: 'invite01',
  isDeleted: false,
  createdAt: DateTime.utc(2026),
);

void main() {
  group('SingleOrgAutoOpenGuard', () {
    test('возвращает id, когда загружена ровно одна организация', () {
      final guard = SingleOrgAutoOpenGuard();
      final section = SectionData<List<Organization>>(
        status: FeatureStatus.success,
        data: [_org(id: 'org-1')],
      );

      expect(guard.resolve(section), 'org-1');
      expect(guard.handled, isTrue);
    });

    test('не срабатывает повторно после первого успешного resolve', () {
      final guard = SingleOrgAutoOpenGuard();
      final section = SectionData<List<Organization>>(
        status: FeatureStatus.success,
        data: [_org(id: 'org-1')],
      );

      expect(guard.resolve(section), 'org-1');
      // Повторный эмит того же успешного состояния (например, после
      // pull-to-refresh) не должен снова вернуть id.
      expect(guard.resolve(section), isNull);
      expect(guard.resolve(section), isNull);
    });

    test('не срабатывает при пустом списке организаций', () {
      final guard = SingleOrgAutoOpenGuard();
      const section = SectionData<List<Organization>>(
        status: FeatureStatus.success,
        data: [],
      );

      expect(guard.resolve(section), isNull);
      expect(guard.handled, isFalse);
    });

    test('не срабатывает при 2+ организациях', () {
      final guard = SingleOrgAutoOpenGuard();
      final section = SectionData<List<Organization>>(
        status: FeatureStatus.success,
        data: [
          _org(id: 'org-1'),
          _org(id: 'org-2'),
        ],
      );

      expect(guard.resolve(section), isNull);
      expect(guard.handled, isFalse);
    });

    test('не срабатывает во время loading, даже если данные уже есть', () {
      final guard = SingleOrgAutoOpenGuard();
      final loadingWithStaleData = SectionData<List<Organization>>(
        status: FeatureStatus.loading,
        data: [_org(id: 'org-1')],
      );

      expect(guard.resolve(loadingWithStaleData), isNull);
      expect(guard.handled, isFalse);
    });

    test('не срабатывает при ошибке загрузки', () {
      final guard = SingleOrgAutoOpenGuard();
      const section = SectionData<List<Organization>>(
        status: FeatureStatus.error,
        error: 'network_error',
      );

      expect(guard.resolve(section), isNull);
      expect(guard.handled, isFalse);
    });

    test('после guard уже handled — переход 2→1 организаций не триггерит', () {
      final guard = SingleOrgAutoOpenGuard();
      final twoOrgs = SectionData<List<Organization>>(
        status: FeatureStatus.success,
        data: [
          _org(id: 'org-1'),
          _org(id: 'org-2'),
        ],
      );
      expect(guard.resolve(twoOrgs), isNull);
      expect(guard.handled, isFalse);

      final oneOrg = SectionData<List<Organization>>(
        status: FeatureStatus.success,
        data: [_org(id: 'org-1')],
      );
      // Первое появление ровно одной организации — это и есть валидный
      // триггер (например, пользователь покинул вторую организацию).
      expect(guard.resolve(oneOrg), 'org-1');
      expect(guard.handled, isTrue);
      // Дальше — не повторяется.
      expect(guard.resolve(oneOrg), isNull);
    });
  });
}
