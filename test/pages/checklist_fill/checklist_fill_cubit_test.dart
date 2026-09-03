import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/core/services/photo_logger.dart';
import 'package:smenka_mobile/core/services/photo_picker_service.dart';
// Скрываем доменный PhotoSource (конфиг требования пункта) — в тесте
// PhotoSource это выбранный источник из PhotoPickerService.
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart'
    hide PhotoSource;
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_fill_cubit.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_photo_draft.dart';

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
    registerFallbackValue(FileCategory.checklistPhoto);
    registerFallbackValue(Uint8List(0));
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
    // Тесты не поднимают Firebase — молчаливый логгер без побочных эффектов.
    photoLogger: PhotoLogger.silent(),
  );

  void stubPick(PhotoPickResult result) {
    when(
      () => pickerService.pickPhoto(source: any(named: 'source')),
    ).thenAnswer((_) async => result);
  }

  // Успешный instance с одним пунктом `_item` — нужен, чтобы _insertPhoto нашёл
  // пункт и вставил серверное фото в стейт.
  void stubInstanceWith(ChecklistInstanceItem item) {
    when(() => checklistRepo.getInstanceDetail(any(), any())).thenAnswer(
      (_) async => Task<ChecklistInstanceDetail>.success(
        ChecklistInstanceDetail(
          id: 'inst1',
          name: 'CL',
          type: ChecklistType.shiftStart,
          isRequired: true,
          status: ChecklistInstanceStatus.pending,
          createdAt: DateTime(2026, 7, 15),
          items: [item],
        ),
      ),
    );
  }

  void stubUploadSuccess() {
    when(
      () => filesRepo.uploadFile(
        bytes: any(named: 'bytes'),
        filename: any(named: 'filename'),
        category: any(named: 'category'),
        organizationId: any(named: 'organizationId'),
        onSendProgress: any(named: 'onSendProgress'),
      ),
    ).thenAnswer(
      (_) async => Task<StoredFile>.success(
        StoredFile(
          id: 'file1',
          category: FileCategory.checklistPhoto,
          originalFilename: 'p.jpg',
          contentType: 'image/jpeg',
          sizeBytes: 10,
          url: 'https://x/p.jpg',
          urlExpiresAt: DateTime(2026, 7, 15, 1),
          createdAt: DateTime(2026, 7, 15),
        ),
      ),
    );
  }

  void stubAttachSuccess() {
    when(
      () => checklistRepo.addItemPhoto(
        any(),
        any(),
        any(),
        fileId: any(named: 'fileId'),
        capturedAt: any(named: 'capturedAt'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer(
      (_) async => const Task<ChecklistItemPhoto>.success(
        ChecklistItemPhoto(id: 'ph1', fileId: 'file1', position: 0),
      ),
    );
  }

  void stubAttachFailure(ApiException error) {
    when(
      () => checklistRepo.addItemPhoto(
        any(),
        any(),
        any(),
        fileId: any(named: 'fileId'),
        capturedAt: any(named: 'capturedAt'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    ).thenAnswer((_) async => Task<ChecklistItemPhoto>.failure(error));
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

  test('реальный burnStamp на недекодируемых байтах → PhotoStampException → '
      'черновик удалён + PHOTO_DECODE_FAILED', () async {
    // Без инъекции photoStamper — идёт настоящий burnStamp. Мусорные байты не
    // декодируются (decodeImage → null), burnStamp бросает PhotoStampException,
    // кубит по catch-пути убирает черновик и эмитит PHOTO_DECODE_FAILED.
    stubPick(PhotoPickSuccess(bytes: Uint8List.fromList([0, 1, 2, 3, 4, 5])));
    final cubit = buildCubit();
    await Future<void>.delayed(Duration.zero);

    await cubit.addPhoto(_item, PhotoSource.camera);

    expect(cubit.state.photoDrafts, isEmpty);
    expect(cubit.state.actionErrorCode, photoDecodeFailedCode);
    verifyZeroInteractions(filesRepo);
    await cubit.close();
  });

  test('happy-path: pick → штамп → upload → attach успех → фото в стейте, '
      'черновик убран', () async {
    stubInstanceWith(_item);
    stubPick(PhotoPickSuccess(bytes: Uint8List.fromList([1, 2, 3])));
    stubUploadSuccess();
    stubAttachSuccess();
    final cubit = buildCubit(
      // Идентичный штампер: изолируем от реального decode/encode.
      photoStamper: (bytes, stampText) async => bytes,
    );
    await Future<void>.delayed(Duration.zero);

    await cubit.addPhoto(_item, PhotoSource.camera);

    // Черновик убран после успешной привязки.
    expect(cubit.state.photoDrafts, isEmpty);
    expect(cubit.state.actionErrorCode, isNull);
    // Серверное фото вставлено в пункт стейта.
    final item = cubit.state.instance.data?.items.firstWhere(
      (i) => i.id == _item.id,
    );
    expect(item?.photosCount, 1);
    expect(item?.photos.single.id, 'ph1');
    // _uploads очищен: повторный retry для этого черновика — no-op (файл/аплоад
    // уже не в карте), репозитории больше не дёргаются.
    clearInteractions(filesRepo);
    clearInteractions(checklistRepo);
    await cubit.retryPhoto(_item.id, 'd0');
    verifyZeroInteractions(filesRepo);
    verifyNever(
      () => checklistRepo.addItemPhoto(
        any(),
        any(),
        any(),
        fileId: any(named: 'fileId'),
        capturedAt: any(named: 'capturedAt'),
        latitude: any(named: 'latitude'),
        longitude: any(named: 'longitude'),
      ),
    );
    await cubit.close();
  });

  test(
    'attach падает с дефолтным (сетевым) кодом → черновик ОСТАЁТСЯ в error с '
    'кодом (для retryPhoto), не удаляется',
    () async {
      stubInstanceWith(_item);
      stubPick(PhotoPickSuccess(bytes: Uint8List.fromList([1, 2, 3])));
      stubUploadSuccess();
      stubAttachFailure(
        const ApiException.network(message: 'net', code: 'NETWORK_ERROR'),
      );
      final cubit = buildCubit(photoStamper: (bytes, stampText) async => bytes);
      await Future<void>.delayed(Duration.zero);

      await cubit.addPhoto(_item, PhotoSource.camera);

      // Ветка default _handleAttachFailure: черновик остаётся для ретрая.
      final drafts = cubit.state.photoDrafts[_item.id];
      expect(drafts, hasLength(1));
      expect(drafts?.single.status, PhotoDraftStatus.error);
      expect(drafts?.single.errorCode, 'NETWORK_ERROR');
      // Тост не поднимаем — ошибка живёт на плитке черновика.
      expect(cubit.state.actionErrorCode, isNull);
      await cubit.close();
    },
  );

  void stubUpdateItem(Task<ChecklistInstanceItem> result) {
    when(
      () => checklistRepo.updateInstanceItem(
        any(),
        any(),
        any(),
        isCompleted: any(named: 'isCompleted'),
        comment: any(named: 'comment'),
      ),
    ).thenAnswer((_) async => result);
  }

  test(
    'отказ сохранения пункта (не SHIFT_FINISHED) → saveError = код ошибки '
    'для тоста, itemStatuses = error, экран остаётся редактируемым',
    () async {
      stubUpdateItem(
        const Task<ChecklistInstanceItem>.failure(
          ApiException.network(message: 'net', code: 'NETWORK_ERROR'),
        ),
      );
      final cubit = buildCubit();
      await Future<void>.delayed(Duration.zero);

      await cubit.toggleItem(_item);

      expect(cubit.state.itemStatuses[_item.id], FeatureStatus.error);
      expect(cubit.state.saveError, 'NETWORK_ERROR');
      expect(cubit.state.readOnly, isFalse);
      await cubit.close();
    },
  );

  test('SHIFT_FINISHED на сохранении пункта → read-only + нотис (симметрично '
      '_handleAttachFailure), тост saveError не поднимаем повторно', () async {
    stubUpdateItem(
      const Task<ChecklistInstanceItem>.failure(
        ApiException.server(message: 'x', code: 'SHIFT_FINISHED'),
      ),
    );
    final cubit = buildCubit();
    await Future<void>.delayed(Duration.zero);

    await cubit.toggleItem(_item);

    expect(cubit.state.readOnly, isTrue);
    expect(cubit.state.notice, PhotoNotice.shiftFinished);
    // SHIFT_FINISHED идёт через notice, не через saveError — иначе один и
    // тот же отказ показался бы пользователю двумя тостами сразу.
    expect(cubit.state.saveError, isNull);
    await cubit.close();
  });

  test('saveError одноразовый: clearSaveError() сбрасывает поле, без нового '
      'отказа сохранения оно само не возвращается', () async {
    stubUpdateItem(
      const Task<ChecklistInstanceItem>.failure(
        ApiException.network(message: 'net', code: 'NETWORK_ERROR'),
      ),
    );
    final cubit = buildCubit();
    await Future<void>.delayed(Duration.zero);

    await cubit.toggleItem(_item);
    expect(cubit.state.saveError, 'NETWORK_ERROR');

    cubit.clearSaveError();
    expect(cubit.state.saveError, isNull);

    await Future<void>.delayed(Duration.zero);
    expect(cubit.state.saveError, isNull);
    await cubit.close();
  });
}
