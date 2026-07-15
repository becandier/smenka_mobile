import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smenka_mobile/core/services/photo_logger.dart';
import 'package:smenka_mobile/core/services/photo_picker_service.dart';

class _MockImagePicker extends Mock implements ImagePicker {}

class _MockXFile extends Mock implements XFile {}

/// Произвольный НЕ-Exception объект — имитация JS-интероп значения (`web.Event`
/// из onerror пикера / `DOMException` из createImageBitmap), которое `on
/// Exception` НЕ ловит. Тесты проверяют, что сервис (ловит `on Object`) их
/// классифицирует, а не роняет как uncaught.
class _JsLikeError {
  @override
  String toString() => 'JsLikeError';
}

final _readBytes = Uint8List.fromList([1, 2, 3, 4]);
final _compressedBytes = Uint8List.fromList([9, 9, 9]);

Future<Uint8List> _okCompressor(
  Uint8List bytes, {
  int maxSide = 1600,
  int quality = 88,
}) async => _compressedBytes;

Future<Uint8List> _emptyCompressor(
  Uint8List bytes, {
  int maxSide = 1600,
  int quality = 88,
}) async => Uint8List(0);

Future<Uint8List> _throwingCompressor(
  Uint8List bytes, {
  int maxSide = 1600,
  int quality = 88,
}) async {
  // ignore: only_throw_errors — намеренно бросаем не-Exception (JS-интероп).
  throw _JsLikeError();
}

void main() {
  late _MockImagePicker picker;
  late _MockXFile file;

  setUpAll(() {
    registerFallbackValue(ImageSource.gallery);
  });

  setUp(() {
    picker = _MockImagePicker();
    file = _MockXFile();
    when(() => file.name).thenReturn('photo.jpg');
    when(() => file.mimeType).thenReturn('image/jpeg');
  });

  PhotoPickerService service({
    bool isWeb = false,
    PhotoCompressor? compressor,
  }) => PhotoPickerService(
    picker: picker,
    logger: PhotoLogger.silent(),
    isWeb: isWeb,
    compressor: compressor ?? _okCompressor,
    // Моки отвечают синхронно — ретраи не должны замедлять тесты.
    readRetryDelay: Duration.zero,
  );

  void stubPick(XFile? result) {
    when(
      () => picker.pickImage(source: any(named: 'source')),
    ).thenAnswer((_) async => result);
  }

  void stubPickThrows(Object error) {
    when(() => picker.pickImage(source: any(named: 'source'))).thenThrow(error);
  }

  void stubRead(Uint8List bytes) {
    when(() => file.readAsBytes()).thenAnswer((_) async => bytes);
  }

  test('pick без imageQuality/maxWidth (единственный ресайз — этап 3)', () async {
    stubPick(file);
    stubRead(_readBytes);

    await service().pickPhoto(source: PhotoSource.camera);

    // Строгий verify по точному набору именованных аргументов: сервис зовёт
    // pickImage ТОЛЬКО с source. Появись здесь imageQuality/maxWidth — этот
    // verify не сматчит вызов и упадёт (отдельный verifyNever был бы пустышкой:
    // mocktail матчит по точному набору ключей, а вызов уже потреблён выше).
    verify(() => picker.pickImage(source: ImageSource.camera)).called(1);
  });

  test('отмена → PhotoPickCancelled', () async {
    stubPick(null);

    final result = await service().pickPhoto(source: PhotoSource.camera);

    expect(result, isA<PhotoPickCancelled>());
  });

  test(
    'PlatformException(camera_access_denied) → PhotoPermissionDenied',
    () async {
      stubPickThrows(PlatformException(code: 'camera_access_denied'));

      final result = await service().pickPhoto(source: PhotoSource.camera);

      expect(result, isA<PhotoPermissionDenied>());
      expect((result as PhotoPickFailure).code, photoPermissionDeniedCode);
    },
  );

  test(
    'PlatformException(photo_access_denied) → PhotoPermissionDenied',
    () async {
      stubPickThrows(PlatformException(code: 'photo_access_denied'));

      final result = await service().pickPhoto(source: PhotoSource.gallery);

      expect(result, isA<PhotoPermissionDenied>());
    },
  );

  test('PlatformException(already_active) → PhotoPickFailed', () async {
    stubPickThrows(PlatformException(code: 'already_active'));

    final result = await service().pickPhoto(source: PhotoSource.camera);

    expect(result, isA<PhotoPickFailed>());
    expect((result as PhotoPickFailure).code, photoPickFailedCode);
  });

  group(
    'не-Exception объект (JS-интероп) на каждом этапе → типизированный failure',
    () {
      test('этап pick → PhotoPickFailed', () async {
        stubPickThrows(_JsLikeError());

        final result = await service().pickPhoto(source: PhotoSource.camera);

        expect(result, isA<PhotoPickFailed>());
      });

      test('этап read → PhotoReadFailed (после ретрая)', () async {
        stubPick(file);
        when(() => file.readAsBytes()).thenThrow(_JsLikeError());

        final result = await service().pickPhoto(source: PhotoSource.camera);

        expect(result, isA<PhotoReadFailed>());
        expect((result as PhotoPickFailure).code, photoReadFailedCode);
        // Ретрай был: readAsBytes вызван дважды.
        verify(() => file.readAsBytes()).called(2);
      });

      test('этап prepare (native) → PhotoDecodeFailed', () async {
        stubPick(file);
        stubRead(_readBytes);

        final result = await service(
          compressor: _throwingCompressor,
        ).pickPhoto(source: PhotoSource.camera);

        expect(result, isA<PhotoDecodeFailed>());
      });
    },
  );

  test(
    'readAsBytes падает один раз, второй раз успех — ретрай работает',
    () async {
      stubPick(file);
      var calls = 0;
      when(() => file.readAsBytes()).thenAnswer((_) async {
        calls++;
        // ignore: only_throw_errors — не-Exception (JS-интероп), сервис ловит on Object.
        if (calls == 1) throw _JsLikeError();
        return _readBytes;
      });

      final result = await service().pickPhoto(source: PhotoSource.camera);

      expect(result, isA<PhotoPickSuccess>());
      expect(calls, 2);
    },
  );

  test('пустые байты после чтения → PhotoFileEmpty', () async {
    stubPick(file);
    stubRead(Uint8List(0));

    final result = await service().pickPhoto(source: PhotoSource.camera);

    expect(result, isA<PhotoFileEmpty>());
    expect((result as PhotoPickFailure).code, photoFileEmptyCode);
    // Пустой результат тоже ретраится один раз.
    verify(() => file.readAsBytes()).called(2);
  });

  test('пустой первый read → ретрай непустой → success', () async {
    stubPick(file);
    var calls = 0;
    when(() => file.readAsBytes()).thenAnswer((_) async {
      calls++;
      return calls == 1 ? Uint8List(0) : _readBytes;
    });

    final result = await service().pickPhoto(source: PhotoSource.camera);

    expect(result, isA<PhotoPickSuccess>());
    expect(calls, 2);
  });

  group('пустой результат компрессора', () {
    test('web → fallback unprocessed:true (исходные байты)', () async {
      stubPick(file);
      stubRead(_readBytes);

      final result = await service(
        isWeb: true,
        compressor: _emptyCompressor,
      ).pickPhoto(source: PhotoSource.camera);

      expect(result, isA<PhotoPickSuccess>());
      final success = result as PhotoPickSuccess;
      expect(success.unprocessed, isTrue);
      expect(success.bytes, _readBytes);
    });

    test('native → PhotoDecodeFailed', () async {
      stubPick(file);
      stubRead(_readBytes);

      final result = await service(
        compressor: _emptyCompressor,
      ).pickPhoto(source: PhotoSource.camera);

      expect(result, isA<PhotoDecodeFailed>());
    });
  });

  test('web: сбой prepare → fallback unprocessed (исходные байты)', () async {
    stubPick(file);
    stubRead(_readBytes);

    final result = await service(
      isWeb: true,
      compressor: _throwingCompressor,
    ).pickPhoto(source: PhotoSource.camera);

    expect(result, isA<PhotoPickSuccess>());
    expect((result as PhotoPickSuccess).unprocessed, isTrue);
  });

  test('не-Exception ПОСЛЕ успешного pick (вне внутренних catch) → '
      'PhotoPickFailed через последний рубеж, не uncaught', () async {
    // pick успешен, но геттер XFile.name бросает сырой Object — обращение к
    // нему (лог `picked name=...`) идёт вне точечных try/catch этапов
    // read/prepare; ловит только финальный `on Object`.
    stubPick(file);
    when(() => file.name).thenThrow(_JsLikeError());

    final result = await service().pickPhoto(source: PhotoSource.camera);

    expect(result, isA<PhotoPickFailed>());
    expect((result as PhotoPickFailure).code, photoPickFailedCode);
  });

  test('happy path → PhotoPickSuccess с байтами компрессора', () async {
    stubPick(file);
    stubRead(_readBytes);

    final result = await service().pickPhoto(source: PhotoSource.camera);

    expect(result, isA<PhotoPickSuccess>());
    final success = result as PhotoPickSuccess;
    expect(success.bytes, _compressedBytes);
    expect(success.unprocessed, isFalse);
    expect(success.sourceName, 'photo.jpg');
    expect(success.sourceMimeType, 'image/jpeg');
  });
}
