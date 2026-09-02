import 'dart:typed_data';

import 'package:camera/camera.dart' show XFile;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/api_exceptions.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/photo_picker_service.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/data/domain/organization/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/models/_models.dart';
import 'package:smenka_mobile/data/domain/shift/repositories/shift_repository.dart';
import 'package:smenka_mobile/data/domain/work_schedule/models/_models.dart';
import 'package:smenka_mobile/data/domain/work_schedule/repositories/work_schedule_repository.dart';
import 'package:smenka_mobile/pages/geo_fallback_start/cubit/geo_fallback_start_cubit.dart';
import 'package:smenka_mobile/pages/geo_fallback_start/cubit/geo_fallback_start_state.dart';

class _MockShiftRepository extends Mock implements ShiftRepository {}

class _MockWorkScheduleRepository extends Mock
    implements WorkScheduleRepository {}

class _MockFilesRepository extends Mock implements FilesRepository {}

class _MockPhotoPickerService extends Mock implements PhotoPickerService {}

class _MockXFile extends Mock implements XFile {}

final _photoBytes = Uint8List.fromList([1, 2, 3]);

const _location = WorkLocation(id: 'loc1', name: 'Склад');

final _now = DateTime.now().toUtc();

WorkSchedule _schedule(
  String id, {
  DateTime? nextStartAt,
  DateTime? nextEndAt,
}) => WorkSchedule(
  id: id,
  name: 'Дневная',
  startTime: '09:00',
  endTime: '18:00',
  durationMinutes: 540,
  crossesMidnight: false,
  nextStartAt: nextStartAt ?? _now.subtract(const Duration(hours: 1)),
  nextEndAt: nextEndAt ?? _now.add(const Duration(hours: 8)),
  isCurrent: true,
  startsInMinutes: -60,
);

MySchedules _schedules(List<WorkSchedule> items, {bool require = false}) =>
    MySchedules(items: items, total: items.length, requireSchedule: require);

Shift _startedShift() => Shift(
  id: 'shift1',
  userId: 'u1',
  startedAt: _now,
  status: ShiftStatus.active,
  pauses: const [],
  workedSeconds: 0,
  geoFallback: true,
  geoFallbackReason: 'GEO_UNAVAILABLE',
);

StoredFile _storedFile() => StoredFile(
  id: 'file1',
  category: FileCategory.shiftGeoPhoto,
  originalFilename: 'shot.jpg',
  contentType: 'image/jpeg',
  sizeBytes: 3,
  url: 'https://example.test/shot.jpg',
  urlExpiresAt: _now,
  createdAt: _now,
);

void main() {
  late _MockShiftRepository shiftRepo;
  late _MockWorkScheduleRepository scheduleRepo;
  late _MockFilesRepository filesRepo;
  late _MockPhotoPickerService photoPicker;

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
    registerFallbackValue(FileCategory.other);
  });

  setUp(() {
    shiftRepo = _MockShiftRepository();
    scheduleRepo = _MockWorkScheduleRepository();
    filesRepo = _MockFilesRepository();
    photoPicker = _MockPhotoPickerService();

    when(() => photoPicker.isCameraAvailable()).thenAnswer((_) async => true);
    when(
      () => scheduleRepo.getMySchedules(
        any(),
        workLocationId: any(named: 'workLocationId'),
      ),
    ).thenAnswer((_) async => Task<MySchedules>.success(_schedules(const [])));
  });

  GeoFallbackStartCubit buildCubit({
    String reason = 'GEO_UNAVAILABLE',
    DateTime Function()? now,
  }) => GeoFallbackStartCubit(
    organizationId: 'org1',
    geoFallbackReason: reason,
    shiftRepository: shiftRepo,
    workScheduleRepository: scheduleRepo,
    filesRepository: filesRepo,
    photoPicker: photoPicker,
    now: now ?? (() => _now),
  );

  void stubUpload(Task<StoredFile> result) {
    when(
      () => filesRepo.uploadFile(
        bytes: any(named: 'bytes'),
        filename: any(named: 'filename'),
        category: any(named: 'category'),
        organizationId: any(named: 'organizationId'),
      ),
    ).thenAnswer((_) async => result);
  }

  void stubStart(Task<Shift> result) {
    when(
      () => shiftRepo.startShift(
        organizationId: any(named: 'organizationId'),
        workLocationId: any(named: 'workLocationId'),
        workScheduleId: any(named: 'workScheduleId'),
        geoFallbackPhotoId: any(named: 'geoFallbackPhotoId'),
        geoFallbackReason: any(named: 'geoFallbackReason'),
      ),
    ).thenAnswer((_) async => result);
  }

  /// Доводит кубит до состояния «точка выбрана, кадр снят».
  Future<GeoFallbackStartCubit> readyCubit({
    String reason = 'GEO_UNAVAILABLE',
    DateTime Function()? now,
  }) async {
    final shot = _MockXFile();
    when(
      () => photoPicker.preparePhoto(shot),
    ).thenAnswer((_) async => PhotoPickSuccess(bytes: _photoBytes));

    final cubit = buildCubit(reason: reason, now: now);
    await pumpEventQueue();
    cubit.selectWorkLocation(_location);
    await pumpEventQueue();
    await cubit.attachShot(shot);
    return cubit;
  }

  group('источник кадра', () {
    test('камера есть → режим съёмки, выбора файла в UI нет', () async {
      final cubit = buildCubit();
      await pumpEventQueue();

      expect(cubit.state.photoMode, GeoFallbackPhotoMode.camera);
      await cubit.close();
    });

    test('камеры нет → фолбэк на выбор файла', () async {
      when(
        () => photoPicker.isCameraAvailable(),
      ).thenAnswer((_) async => false);

      final cubit = buildCubit();
      await pumpEventQueue();

      expect(cubit.state.photoMode, GeoFallbackPhotoMode.file);
      await cubit.close();
    });

    test('камера отвалилась после пробы → файл + код ошибки', () async {
      final error = Exception('getUserMedia failed');
      when(
        () => photoPicker.classifyCaptureError(error),
      ).thenReturn(const PhotoPermissionDenied());

      final cubit = buildCubit();
      await pumpEventQueue();
      cubit.onCameraUnavailable(error);

      expect(cubit.state.photoMode, GeoFallbackPhotoMode.file);
      expect(cubit.state.photoErrorCode, photoPermissionDeniedCode);
      await cubit.close();
    });

    test('отмена выбора файла — не ошибка', () async {
      when(
        () => photoPicker.pickPhoto(source: PhotoSource.gallery),
      ).thenAnswer((_) async => const PhotoPickCancelled());

      final cubit = buildCubit();
      await pumpEventQueue();
      await cubit.pickFromFile();

      expect(cubit.state.hasPhoto, isFalse);
      expect(cubit.state.photoErrorCode, isNull);
      expect(cubit.state.photoProcessing, isFalse);
      await cubit.close();
    });

    test(
      'сбой подготовки кадра → код из таксономии PhotoPickFailure',
      () async {
        final shot = _MockXFile();
        when(
          () => photoPicker.preparePhoto(shot),
        ).thenAnswer((_) async => const PhotoReadFailed());

        final cubit = buildCubit();
        await pumpEventQueue();
        await cubit.attachShot(shot);

        expect(cubit.state.photoErrorCode, photoReadFailedCode);
        expect(cubit.state.hasPhoto, isFalse);
        await cubit.close();
      },
    );
  });

  group('точка и график', () {
    test('выбор точки резолвит график по work_location_id', () async {
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(_schedules([_schedule('s1')])),
      );

      final cubit = buildCubit();
      await pumpEventQueue();
      cubit.selectWorkLocation(_location);
      await pumpEventQueue();

      // Ровно один вариант — подставился сам, как в обычном старте.
      expect(cubit.state.workScheduleId, 's1');
      verify(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
      ).called(1);
      await cubit.close();
    });

    test('>1 графика → выбор обязателен, старт закрыт до него', () async {
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
      ).thenAnswer(
        (_) async => Task<MySchedules>.success(
          _schedules([_schedule('s1'), _schedule('s2')]),
        ),
      );

      final cubit = await readyCubit();
      expect(cubit.state.scheduleSelectionRequired, isTrue);
      expect(cubit.state.canSubmit, isFalse);

      cubit.selectWorkSchedule(_schedule('s2'));
      expect(cubit.state.canSubmit, isTrue);
      await cubit.close();
    });

    test('0 графиков при require_schedule → старт заблокирован', () async {
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
      ).thenAnswer(
        (_) async =>
            Task<MySchedules>.success(_schedules(const [], require: true)),
      );

      final cubit = await readyCubit();

      expect(cubit.state.scheduleBlockedNoOptions, isTrue);
      expect(cubit.state.canSubmit, isFalse);
      await cubit.close();
    });

    test(
      'optional + закрытый график → выбор не нужен, submit доступен',
      () async {
        final closed = _schedule(
          'closed',
          nextStartAt: _now.add(const Duration(hours: 1)),
          nextEndAt: _now.add(const Duration(hours: 10)),
        );
        when(
          () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
        ).thenAnswer(
          (_) async => Task<MySchedules>.success(_schedules([closed])),
        );

        final cubit = await readyCubit();

        expect(cubit.state.workScheduleId, isNull);
        expect(cubit.state.scheduleSelectionRequired, isFalse);
        expect(cubit.state.canSubmit, isTrue);
        await cubit.close();
      },
    );

    test('canSubmit использует тот же источник времени, что и cubit', () async {
      final fixedNow = DateTime.utc(2026, 6, 11, 10);
      final open = _schedule(
        'open',
        nextStartAt: fixedNow.subtract(const Duration(hours: 1)),
        nextEndAt: fixedNow.add(const Duration(hours: 1)),
      );
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
      ).thenAnswer(
        (_) async =>
            Task<MySchedules>.success(_schedules([open], require: true)),
      );

      final cubit = await readyCubit(now: () => fixedNow);

      expect(cubit.state.workScheduleId, 'open');
      expect(cubit.state.canSubmit, isTrue);
      await cubit.close();
    });

    test('required + закрытый график → submit заблокирован окном', () async {
      final closed = _schedule(
        'closed',
        nextStartAt: _now.add(const Duration(hours: 1)),
        nextEndAt: _now.add(const Duration(hours: 10)),
      );
      when(
        () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
      ).thenAnswer(
        (_) async =>
            Task<MySchedules>.success(_schedules([closed], require: true)),
      );

      final cubit = await readyCubit();

      expect(cubit.state.workScheduleId, isNull);
      expect(cubit.state.canSubmit, isFalse);
      await cubit.close();
    });

    test('без точки старт невозможен', () async {
      final shot = _MockXFile();
      when(
        () => photoPicker.preparePhoto(shot),
      ).thenAnswer((_) async => PhotoPickSuccess(bytes: _photoBytes));

      final cubit = buildCubit();
      await pumpEventQueue();
      await cubit.attachShot(shot);

      expect(cubit.state.hasPhoto, isTrue);
      expect(cubit.state.canSubmit, isFalse);
      expect(await cubit.submit(), isNull);
      verifyNever(
        () => filesRepo.uploadFile(
          bytes: any(named: 'bytes'),
          filename: any(named: 'filename'),
          category: any(named: 'category'),
          organizationId: any(named: 'organizationId'),
        ),
      );
      await cubit.close();
    });
  });

  group('отправка', () {
    test(
      'optional + закрытый график → запрос старта без work_schedule_id',
      () async {
        final closed = _schedule(
          'closed',
          nextStartAt: _now.add(const Duration(hours: 1)),
          nextEndAt: _now.add(const Duration(hours: 10)),
        );
        when(
          () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
        ).thenAnswer(
          (_) async => Task<MySchedules>.success(_schedules([closed])),
        );
        stubUpload(Task<StoredFile>.success(_storedFile()));
        stubStart(Task<Shift>.success(_startedShift()));

        final cubit = await readyCubit();
        final shift = await cubit.submit();

        expect(shift?.id, 'shift1');
        verify(
          () => shiftRepo.startShift(
            organizationId: 'org1',
            workLocationId: 'loc1',
            workScheduleId: any(named: 'workScheduleId', that: isNull),
            geoFallbackPhotoId: 'file1',
            geoFallbackReason: 'GEO_UNAVAILABLE',
          ),
        ).called(1);
        await cubit.close();
      },
    );

    test('happy path: фото в категорию shift_geo_photo, старт без координат '
        'с кодом причины', () async {
      stubUpload(Task<StoredFile>.success(_storedFile()));
      stubStart(Task<Shift>.success(_startedShift()));

      final cubit = await readyCubit(reason: 'GEO_PERMISSION_DENIED_FOREVER');
      final shift = await cubit.submit();

      expect(shift?.id, 'shift1');
      expect(cubit.state.submitStatus, FeatureStatus.success);
      verify(
        () => filesRepo.uploadFile(
          bytes: _photoBytes,
          filename: any(named: 'filename'),
          category: FileCategory.shiftGeoPhoto,
          organizationId: 'org1',
        ),
      ).called(1);
      verify(
        () => shiftRepo.startShift(
          organizationId: 'org1',
          workLocationId: 'loc1',
          // Графиков у точки нет — поле не заполняется.
          workScheduleId: any(named: 'workScheduleId', that: isNull),
          geoFallbackPhotoId: 'file1',
          // Код фактически полученного гео-отказа, а не константа по месту.
          geoFallbackReason: 'GEO_PERMISSION_DENIED_FOREVER',
        ),
      ).called(1);
      await cubit.close();
    });

    test('сбой аплоада → старт не отправляется', () async {
      stubUpload(
        const Task<StoredFile>.failure(
          ApiException.server(message: 'too large', code: 'FILE_TOO_LARGE'),
        ),
      );

      final cubit = await readyCubit();
      final shift = await cubit.submit();

      expect(shift, isNull);
      expect(cubit.state.submitErrorCode, 'FILE_TOO_LARGE');
      verifyNever(
        () => shiftRepo.startShift(
          organizationId: any(named: 'organizationId'),
          workLocationId: any(named: 'workLocationId'),
          workScheduleId: any(named: 'workScheduleId'),
          geoFallbackPhotoId: any(named: 'geoFallbackPhotoId'),
          geoFallbackReason: any(named: 'geoFallbackReason'),
        ),
      );
      await cubit.close();
    });

    test(
      'GEO_FALLBACK_PHOTO_INVALID → кадр сброшен, шаг фото заново',
      () async {
        stubUpload(Task<StoredFile>.success(_storedFile()));
        stubStart(
          const Task<Shift>.failure(
            ApiException.server(
              message: 'bad photo',
              code: 'GEO_FALLBACK_PHOTO_INVALID',
            ),
          ),
        );

        final cubit = await readyCubit();
        final shift = await cubit.submit();

        expect(shift, isNull);
        expect(cubit.state.hasPhoto, isFalse);
        expect(cubit.state.photoErrorCode, geoFallbackPhotoInvalidCode);
        await cubit.close();
      },
    );

    test(
      'повторная отправка грузит файл заново (сирота не переиспользуется)',
      () async {
        stubUpload(Task<StoredFile>.success(_storedFile()));
        stubStart(
          const Task<Shift>.failure(
            ApiException.network(message: 'no net', code: 'NETWORK_ERROR'),
          ),
        );

        final cubit = await readyCubit();
        await cubit.submit();
        // Кадр на месте (сеть, а не отказ по фото) — пробуем ещё раз.
        expect(cubit.state.hasPhoto, isTrue);
        await cubit.submit();

        verify(
          () => filesRepo.uploadFile(
            bytes: any(named: 'bytes'),
            filename: any(named: 'filename'),
            category: any(named: 'category'),
            organizationId: any(named: 'organizationId'),
          ),
        ).called(2);
        await cubit.close();
      },
    );

    test(
      'SCHEDULE_WINDOW_CLOSED → выбор сброшен, набор перезапрошен',
      () async {
        when(
          () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
        ).thenAnswer(
          (_) async => Task<MySchedules>.success(_schedules([_schedule('s1')])),
        );
        stubUpload(Task<StoredFile>.success(_storedFile()));
        stubStart(
          const Task<Shift>.failure(
            ApiException.server(
              message: 'window closed',
              code: 'SCHEDULE_WINDOW_CLOSED',
            ),
          ),
        );

        final cubit = await readyCubit();
        await cubit.submit();
        await pumpEventQueue();

        verify(
          () => scheduleRepo.getMySchedules('org1', workLocationId: 'loc1'),
        ).called(2);
        await cubit.close();
      },
    );
  });
}
