import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/core/services/photo_picker_service.dart';
// Скрываем доменный PhotoSource (конфиг требования пункта) — в тесте
// PhotoSource это выбранный источник из PhotoPickerService.
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart'
    hide PhotoSource;
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_fill_cubit.dart';

class _MockChecklistRepository extends Mock implements ChecklistRepository {}

class _MockFilesRepository extends Mock implements FilesRepository {}

class _MockGeoService extends Mock implements GeoService {}

class _MockPhotoPickerService extends Mock implements PhotoPickerService {}

const _item = ChecklistInstanceItem(
  id: 'i1',
  text: 'Пункт',
  isRequired: true,
  position: 0,
  isCompleted: false,
  changeCount: 0,
);

void main() {
  late _MockChecklistRepository checklistRepo;
  late _MockFilesRepository filesRepo;
  late _MockGeoService geo;
  late _MockPhotoPickerService pickerService;

  setUpAll(() {
    registerFallbackValue(PhotoSource.camera);
  });

  setUp(() {
    checklistRepo = _MockChecklistRepository();
    filesRepo = _MockFilesRepository();
    geo = _MockGeoService();
    pickerService = _MockPhotoPickerService();

    // loadInstance() зовётся в конструкторе — фото-флоу от instance не зависит,
    // поэтому отдаём ошибку (детали строить не нужно).
    when(() => checklistRepo.getInstanceDetail(any(), any())).thenAnswer(
      (_) async => const Task<ChecklistInstanceDetail>.failure(
        ApiException.network(message: 'x', code: 'NETWORK_ERROR'),
      ),
    );
    // Гео не блокирует флоу — по умолчанию успешно (без нотиса).
    when(() => geo.getCurrentPosition()).thenAnswer(
      (_) async =>
          const GeoSuccess(latitude: 55, longitude: 37, lowAccuracy: false),
    );
  });

  ChecklistFillCubit buildCubit({
    Future<Uint8List> Function(Uint8List bytes, String stampText)? photoStamper,
  }) => ChecklistFillCubit(
    shiftId: 's1',
    instanceId: 'inst1',
    organizationId: 'org1',
    checklistRepository: checklistRepo,
    filesRepository: filesRepo,
    geoService: geo,
    photoPickerService: pickerService,
    photoStamper: photoStamper,
  );

  void stubPick(PhotoPickResult result) {
    when(
      () => pickerService.pickPhoto(source: any(named: 'source')),
    ).thenAnswer((_) async => result);
  }

  test('отмена пикера → черновик не создаётся, ошибки нет', () async {
    stubPick(const PhotoPickCancelled());
    final cubit = buildCubit();
    await Future<void>.delayed(Duration.zero);

    await cubit.addPhoto(_item, PhotoSource.camera);

    expect(cubit.state.photoDrafts, isEmpty);
    expect(cubit.state.actionErrorCode, isNull);
    verifyNever(() => geo.getCurrentPosition());
    await cubit.close();
  });

  test(
    'failure пикера → actionErrorCode по коду, черновик не создаётся',
    () async {
      stubPick(const PhotoPermissionDenied());
      final cubit = buildCubit();
      await Future<void>.delayed(Duration.zero);

      await cubit.addPhoto(_item, PhotoSource.camera);

      expect(cubit.state.actionErrorCode, photoPermissionDeniedCode);
      expect(cubit.state.photoDrafts, isEmpty);
      verifyNever(() => geo.getCurrentPosition());
      await cubit.close();
    },
  );

  test(
    'сбой штампа после черновика → черновик удалён + PHOTO_DECODE_FAILED',
    () async {
      stubPick(PhotoPickSuccess(bytes: Uint8List.fromList([1, 2, 3])));
      final cubit = buildCubit(
        photoStamper: (bytes, stampText) async => throw StateError('boom'),
      );
      await Future<void>.delayed(Duration.zero);

      await cubit.addPhoto(_item, PhotoSource.camera);

      // Инвариант: любой отказ после _addDraft убирает черновик.
      expect(cubit.state.photoDrafts, isEmpty);
      expect(cubit.state.actionErrorCode, photoDecodeFailedCode);
      // Аплоад не начинался: files-репозиторий не трогали (штамп упал раньше).
      verifyZeroInteractions(filesRepo);
      await cubit.close();
    },
  );
}
