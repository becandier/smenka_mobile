import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';

void main() {
  group('SectionData', () {
    test('initial state has no data and initial status', () {
      const section = SectionData<int>();

      expect(section.data, isNull);
      expect(section.status, FeatureStatus.initial);
      expect(section.error, isNull);
      expect(section.errorCode, isNull);
    });

    test('toSuccess stores data and clears error', () {
      final section = const SectionData<int>()
          .toError('boom', code: 'SOME_CODE')
          .toSuccess(42);

      expect(section.data, 42);
      expect(section.status, FeatureStatus.success);
      expect(section.error, isNull);
      expect(section.errorCode, isNull);
    });

    test('toError keeps previous data and stores code', () {
      final section =
          const SectionData<int>().toSuccess(42).toError('boom', code: 'X');

      expect(section.data, 42);
      expect(section.status, FeatureStatus.error);
      expect(section.error, 'boom');
      expect(section.errorCode, 'X');
    });
  });
}
