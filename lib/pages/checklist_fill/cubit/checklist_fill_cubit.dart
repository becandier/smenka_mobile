import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/core/services/photo_logger.dart';
import 'package:smenka_mobile/core/services/photo_picker_service.dart';
import 'package:smenka_mobile/core/time/app_time.dart';
// Скрываем доменный PhotoSource (camera/cameraOrGallery — конфиг требования
// пункта): в кубите PhotoSource — это выбранный источник из PhotoPickerService.
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart'
    hide PhotoSource;
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_fill_state.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_photo_draft.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/photo_processing.dart';

class ChecklistFillCubit extends Cubit<ChecklistFillState> {
  ChecklistFillCubit({
    required String shiftId,
    required String instanceId,
    required ChecklistRepository checklistRepository,
    required FilesRepository filesRepository,
    required GeoService geoService,
    required PhotoPickerService photoPickerService,
    String? organizationId,
    bool readOnly = false,
    Future<Uint8List> Function(Uint8List bytes, String stampText)? photoStamper,
    PhotoLogger? photoLogger,
  }) : _shiftId = shiftId,
       _instanceId = instanceId,
       _organizationId = organizationId,
       _checklistRepository = checklistRepository,
       _filesRepository = filesRepository,
       _geoService = geoService,
       _photoPickerService = photoPickerService,
       _photoStamper = photoStamper ?? burnStamp,
       _photoLogger = photoLogger ?? PhotoLogger(),
       super(ChecklistFillState(readOnly: readOnly)) {
    loadInstance();
  }

  final String _shiftId;
  final String _instanceId;
  final String? _organizationId;
  final ChecklistRepository _checklistRepository;
  final FilesRepository _filesRepository;
  final GeoService _geoService;
  final PhotoPickerService _photoPickerService;

  /// Вжигание антифрод-штампа (по умолчанию [burnStamp]). Инъекция — для тестов
  /// инварианта «отказ после показа черновика убирает черновик».
  final Future<Uint8List> Function(Uint8List bytes, String stampText)
  _photoStamper;

  /// Логгер этапа штампа (по образцу `PhotoPickerService`). В page-DI — тот же
  /// инстанс, что и у сервиса, чтобы крошки/репорты фото шли одной цепочкой.
  final PhotoLogger _photoLogger;

  final Map<String, Timer> _commentDebouncers = {};

  /// Тяжёлые данные черновиков загрузки (байты кадра + `file_id` для ретрая
  /// привязки) — вне стейта, чтобы не сравнивать мегабайты при каждом emit.
  final Map<String, _PhotoUpload> _uploads = {};
  int _draftCounter = 0;

  /// Контекст штампа фото и настенного времени пункта: self-contained
  /// деталь чек-листа уже несёт `organizationTimezone` (org-чек-лист всегда
  /// имеет организацию — см. [addPhoto]); `null` (персональная смена/старый
  /// бэк) — контекст устройства.
  AppTimeContext get _timeContext =>
      state.instance.data?.timeContext() ?? const AppTimeContext.device();

  // Загрузка/привязка фото — длинные async-операции; пользователь может уйти со
  // страницы раньше, чем завершится upload/attach или onSendProgress-колбэк.
  // Гасим emit на закрытом кубите (как в ShiftTrackerCubit), чтобы не ловить
  // «emit after close» в фоновых колбэках.
  @override
  void emit(ChecklistFillState state) {
    if (isClosed) return;
    super.emit(state);
  }

  @override
  Future<void> close() {
    for (final timer in _commentDebouncers.values) {
      timer.cancel();
    }
    _commentDebouncers.clear();
    _uploads.clear();
    return super.close();
  }

  Future<void> loadInstance() async {
    emit(state.copyWith(instance: state.instance.toLoading()));
    final result = await _checklistRepository.getInstanceDetail(
      _shiftId,
      _instanceId,
    );
    result.fold(
      onSuccess: (detail) {
        emit(state.copyWith(instance: state.instance.toSuccess(detail)));
      },
      onFailure: (error) {
        emit(state.copyWith(instance: state.instance.toError(error.message)));
      },
    );
  }

  Future<void> toggleItem(ChecklistInstanceItem item) async {
    if (state.readOnly) return;
    await _update(item, isCompleted: !item.isCompleted, comment: item.comment);
  }

  void scheduleCommentUpdate(ChecklistInstanceItem item, String? comment) {
    if (state.readOnly) return;
    _commentDebouncers[item.id]?.cancel();
    _commentDebouncers[item.id] = Timer(const Duration(milliseconds: 600), () {
      _update(item, isCompleted: item.isCompleted, comment: comment);
    });
  }

  Future<void> _update(
    ChecklistInstanceItem item, {
    required bool isCompleted,
    String? comment,
  }) async {
    final statuses = {...state.itemStatuses};
    statuses[item.id] = FeatureStatus.loading;
    emit(state.copyWith(itemStatuses: statuses, saveError: null));

    final result = await _checklistRepository.updateInstanceItem(
      _shiftId,
      _instanceId,
      item.id,
      isCompleted: isCompleted,
      comment: comment,
    );

    result.fold(
      onSuccess: (updated) {
        final newStatuses = {...state.itemStatuses};
        newStatuses[item.id] = FeatureStatus.success;

        final detail = state.instance.data;
        if (detail != null) {
          // Сохраняем локальные фото пункта (сервер в PATCH-ответе их не
          // возвращает) — мержим обновлённые поля поверх текущего пункта.
          final newItems = detail.items.map((i) {
            if (i.id != updated.id) return i;
            return updated.copyWith(
              photoRequirement: i.photoRequirement,
              photoSource: i.photoSource,
              photosCount: i.photosCount,
              photos: i.photos,
            );
          }).toList();
          emit(
            state.copyWith(
              instance: state.instance.toSuccess(
                detail.copyWith(items: newItems),
              ),
              itemStatuses: newStatuses,
            ),
          );
        } else {
          emit(state.copyWith(itemStatuses: newStatuses));
        }
        // PATCH возвращает авторитетный пункт — мержим его выше и не делаем
        // полный loadInstance(): он бы (а) мигал шиммером, (б) мог перетереть
        // локально вставленное фото другого пункта (гонка с addPhoto). Сводку
        // по фото пересчитает экран списка при возврате (сам перезагружается).
      },
      onFailure: (error) {
        final newStatuses = {...state.itemStatuses};
        newStatuses[item.id] = FeatureStatus.error;
        if (error.code == 'SHIFT_FINISHED') {
          // Смена завершилась (авто-завершение/админ), пока сотрудник заполнял
          // чек-лист — ретрай бессмысленен, переходим в read-only симметрично
          // _handleAttachFailure (тот же нотис/текст, что и для фото).
          emit(
            state.copyWith(
              itemStatuses: newStatuses,
              readOnly: true,
              notice: PhotoNotice.shiftFinished,
            ),
          );
        } else {
          emit(
            state.copyWith(itemStatuses: newStatuses, saveError: error.code),
          );
        }
      },
    );
  }

  // --- Photos ---

  /// Антифрод-флоу: pick+подготовка (`PhotoPickerService`) → плейсхолдер →
  /// гео → штамп в изоляте → upload (`POST /files`) → привязка
  /// (`POST .../photos`). Гео-отказ не прерывает — штамп вжигается только со
  /// временем, показывается нотис. Выбор/подготовка кадра типизированы: отмена —
  /// молча, любой failure — локализованный тост по коду сервиса (клиентский
  /// `PHOTO_FILE_INVALID` больше не эмитится).
  Future<void> addPhoto(ChecklistInstanceItem item, PhotoSource source) async {
    if (state.readOnly) return;
    if (_organizationId == null) return; // орг-смена всегда имеет org

    final result = await _photoPickerService.pickPhoto(source: source);
    switch (result) {
      case PhotoPickCancelled():
        return; // отменили выбор — молча
      case PhotoPickFailure(:final code):
        emit(state.copyWith(actionErrorCode: code));
        return;
      case PhotoPickSuccess(:final bytes):
        await _stampAndUpload(item, bytes);
    }
  }

  /// Показ плейсхолдера → гео → штамп → upload. Инвариант: **любой** отказ
  /// после [_addDraft] обязан вызвать [_removeDraft] (иначе плитка виснет в
  /// «uploading»).
  Future<void> _stampAndUpload(
    ChecklistInstanceItem item,
    Uint8List bytes,
  ) async {
    final draftId = 'd${_draftCounter++}';
    _addDraft(item.id, draftId);

    // Гео не блокирует флоу: отказ/недоступность → координаты null + нотис.
    double? latitude;
    double? longitude;
    final geo = await _geoService.getCurrentPosition();
    if (geo is GeoSuccess) {
      latitude = geo.latitude;
      longitude = geo.longitude;
    } else {
      emit(state.copyWith(notice: PhotoNotice.geoUnavailable));
    }

    final capturedAt = DateTime.now().toUtc();

    final Uint8List stamped;
    try {
      stamped = await _photoStamper(
        bytes,
        _stampText(capturedAt, latitude, longitude),
      );
    } on Object catch (e, st) {
      // Штамп не удался (decode/encode кадра, в т.ч. PhotoStampException на
      // недекодируемом кадре) — ретрай тех же байтов не поможет. Логируем
      // реальную причину и стек (раньше слепой `on Object` их терял), убираем
      // черновик (инвариант) и показываем тост.
      _photoLogger.error('stamp', e, st);
      _removeDraft(item.id, draftId);
      emit(state.copyWith(actionErrorCode: photoDecodeFailedCode));
      return;
    }

    _uploads[draftId] = _PhotoUpload(
      itemId: item.id,
      bytes: stamped,
      filename: 'checklist_${item.id}_${capturedAt.millisecondsSinceEpoch}.jpg',
      capturedAt: capturedAt,
      latitude: latitude,
      longitude: longitude,
    );

    await _uploadAndAttach(draftId);
  }

  /// Ручной ретрай частичного сбоя. Если файл уже загружен (`fileId != null`)
  /// и ошибка была не про файл — ретраим только привязку; иначе грузим заново.
  Future<void> retryPhoto(String itemId, String draftId) async {
    if (state.readOnly) return;
    if (!_uploads.containsKey(draftId)) return;
    _setDraftUploading(itemId, draftId);
    await _uploadAndAttach(draftId);
  }

  void removePhotoDraft(String itemId, String draftId) {
    _uploads.remove(draftId);
    _removeDraft(itemId, draftId);
  }

  /// Возвращает `true`, если фото удалено (или его уже нет на сервере) — вьюер
  /// по этому флагу убирает кадр из своей локальной галереи.
  Future<bool> removePhoto(ChecklistInstanceItem item, String photoId) async {
    if (state.readOnly) return false;
    final result = await _checklistRepository.deleteItemPhoto(
      _shiftId,
      _instanceId,
      item.id,
      photoId,
    );
    return result.fold(
      onSuccess: (_) {
        _removePhotoFromInstance(item.id, photoId);
        return true;
      },
      onFailure: (error) {
        // Фото уже нет на сервере — синхронизируем локально без шумного тоста.
        if (error.code == 'PHOTO_NOT_FOUND') {
          _removePhotoFromInstance(item.id, photoId);
          return true;
        }
        emit(state.copyWith(actionErrorCode: error.code));
        return false;
      },
    );
  }

  void clearNotice() => emit(state.copyWith(notice: null));

  void clearActionError() => emit(state.copyWith(actionErrorCode: null));

  void clearSaveError() => emit(state.copyWith(saveError: null));

  Future<void> _uploadAndAttach(String draftId) async {
    final upload = _uploads[draftId];
    final orgId = _organizationId;
    if (upload == null || orgId == null) return;

    _setDraftProgress(upload.itemId, draftId, 0);

    if (upload.fileId == null) {
      final uploadResult = await _filesRepository.uploadFile(
        bytes: upload.bytes,
        filename: upload.filename,
        category: FileCategory.checklistPhoto,
        organizationId: orgId,
        onSendProgress: (sent, total) {
          if (total > 0) {
            _setDraftProgress(upload.itemId, draftId, sent / total);
          }
        },
      );
      final uploaded = uploadResult.fold(
        onSuccess: (file) {
          upload.fileId = file.id;
          return true;
        },
        onFailure: (error) {
          _setDraftError(upload.itemId, draftId, error.code);
          return false;
        },
      );
      if (!uploaded) return;
    }

    final fileId = upload.fileId;
    if (fileId == null) return;

    final attachResult = await _checklistRepository.addItemPhoto(
      _shiftId,
      _instanceId,
      upload.itemId,
      fileId: fileId,
      capturedAt: upload.capturedAt,
      latitude: upload.latitude,
      longitude: upload.longitude,
    );

    attachResult.fold(
      onSuccess: (photo) {
        _uploads.remove(draftId);
        _removeDraft(upload.itemId, draftId);
        _insertPhoto(upload.itemId, photo);
      },
      onFailure: (error) => _handleAttachFailure(draftId, upload, error.code),
    );
  }

  void _handleAttachFailure(String draftId, _PhotoUpload upload, String? code) {
    switch (code) {
      case 'SHIFT_FINISHED':
        // Смена авто-завершилась во время добавления: переходим в read-only,
        // ретрай не предлагаем (файл-сирота вычистится cleanup_orphan_files).
        _uploads.clear();
        emit(
          state.copyWith(
            readOnly: true,
            notice: PhotoNotice.shiftFinished,
            photoDrafts: const {},
          ),
        );
      case 'PHOTO_LIMIT_EXCEEDED':
      case 'PHOTO_NOT_ALLOWED':
        // Ретрай бессмысленен — убираем черновик и показываем тост.
        _uploads.remove(draftId);
        _removeDraft(upload.itemId, draftId);
        emit(state.copyWith(actionErrorCode: code));
      case 'PHOTO_FILE_INVALID':
        // Файл-сирота протух/удалён — ретрай должен грузить файл заново.
        upload.fileId = null;
        _setDraftError(upload.itemId, draftId, code);
      default:
        // Сеть/сервер — ретрай только привязки (file_id сохраняется).
        _setDraftError(upload.itemId, draftId, code);
    }
  }

  /// Штамп «дата время [+координаты]», сожжённый в пиксели фото — правится
  /// на устройстве фотографирующего, поэтому обязан использовать контекст
  /// смены ([_timeContext]), а не таймзону устройства напрямую: сотрудник
  /// организации в Москве, снимающий на телефоне с системным временем
  /// Владивостока, не должен получить штамп во владивостокском времени.
  /// Ручной паттерн `dd.MM.yyyy HH:mm` (пробел, не запятая — компактнее на
  /// водяном знаке) сохранён как есть, без `DateFormat`/`intl`.
  String _stampText(
    DateTime capturedAtUtc,
    double? latitude,
    double? longitude,
  ) {
    final wall = const AppTime().wallTime(capturedAtUtc, _timeContext);
    final dt =
        '${_twoDigits(wall.day)}.${_twoDigits(wall.month)}.${wall.year} '
        '${_twoDigits(wall.hour)}:${_twoDigits(wall.minute)}';
    if (latitude == null || longitude == null) return dt;
    return '$dt\n'
        '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}';
  }

  // --- Draft helpers ---

  void _addDraft(String itemId, String draftId) {
    final map = {...state.photoDrafts};
    map[itemId] = [
      ...?map[itemId],
      ChecklistPhotoDraft(
        draftId: draftId,
        itemId: itemId,
        status: PhotoDraftStatus.uploading,
      ),
    ];
    emit(state.copyWith(photoDrafts: map));
  }

  void _updateDraft(
    String itemId,
    String draftId,
    ChecklistPhotoDraft Function(ChecklistPhotoDraft draft) update,
  ) {
    final list = state.photoDrafts[itemId];
    if (list == null) return;
    final map = {...state.photoDrafts};
    map[itemId] = list
        .map((d) => d.draftId == draftId ? update(d) : d)
        .toList();
    emit(state.copyWith(photoDrafts: map));
  }

  void _setDraftProgress(String itemId, String draftId, double progress) {
    _updateDraft(
      itemId,
      draftId,
      (d) => d.copyWith(
        status: PhotoDraftStatus.uploading,
        progress: progress,
        errorCode: null,
      ),
    );
  }

  void _setDraftUploading(String itemId, String draftId) {
    _updateDraft(
      itemId,
      draftId,
      (d) => d.copyWith(
        status: PhotoDraftStatus.uploading,
        progress: 0,
        errorCode: null,
      ),
    );
  }

  void _setDraftError(String itemId, String draftId, String? code) {
    _updateDraft(
      itemId,
      draftId,
      (d) => d.copyWith(status: PhotoDraftStatus.error, errorCode: code),
    );
  }

  void _removeDraft(String itemId, String draftId) {
    final list = state.photoDrafts[itemId];
    if (list == null) return;
    final remaining = list.where((d) => d.draftId != draftId).toList();
    final map = {...state.photoDrafts};
    if (remaining.isEmpty) {
      map.remove(itemId);
    } else {
      map[itemId] = remaining;
    }
    emit(state.copyWith(photoDrafts: map));
  }

  // --- Instance photo mutations (local) ---

  void _insertPhoto(String itemId, ChecklistItemPhoto photo) {
    final detail = state.instance.data;
    if (detail == null) return;
    final items = detail.items.map((i) {
      if (i.id != itemId) return i;
      final photos = [...i.photos, photo]
        ..sort((a, b) => a.position.compareTo(b.position));
      return i.copyWith(photos: photos, photosCount: photos.length);
    }).toList();
    emit(
      state.copyWith(
        instance: state.instance.toSuccess(detail.copyWith(items: items)),
      ),
    );
  }

  void _removePhotoFromInstance(String itemId, String photoId) {
    final detail = state.instance.data;
    if (detail == null) return;
    final items = detail.items.map((i) {
      if (i.id != itemId) return i;
      final photos = i.photos.where((p) => p.id != photoId).toList();
      return i.copyWith(photos: photos, photosCount: photos.length);
    }).toList();
    emit(
      state.copyWith(
        instance: state.instance.toSuccess(detail.copyWith(items: items)),
      ),
    );
  }
}

class _PhotoUpload {
  _PhotoUpload({
    required this.itemId,
    required this.bytes,
    required this.filename,
    required this.capturedAt,
    this.latitude,
    this.longitude,
  });

  final String itemId;
  final Uint8List bytes;
  final String filename;
  final DateTime capturedAt;
  final double? latitude;
  final double? longitude;

  /// `file_id` после успешного `POST /files` — для ретрая только привязки.
  String? fileId;
}

String _twoDigits(int value) => value.toString().padLeft(2, '0');
