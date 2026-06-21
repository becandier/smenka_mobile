import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;

/// Антифрод-обработка фото перед загрузкой: нативный ресайз/сжатие в JPEG +
/// вжигание видимого штампа (дата/время + координаты) в пиксели.
///
/// Почему так: хранилище стрипает EXIF, поэтому метаданные нельзя полагать на
/// EXIF — штамп вжигается прямо в кадр. Пакет `image` не декодит HEIC, поэтому
/// сначала прогоняем кадр через `flutter_image_compress` (нативно декодит HEIC,
/// выправляет ориентацию по EXIF и отдаёт JPEG), а штамп рисуем уже на
/// уменьшённом JPEG. Тяжёлый decode/draw/encode уносим в фоновый изолят через
/// [compute] (web-safe: там выполнится на main-потоке).
Future<Uint8List> processChecklistPhoto({
  required Uint8List original,
  required String stampText,
}) async {
  // Нативный ресайз ~1600px по большей стороне + перекодирование в JPEG.
  // autoCorrectionAngle — впекаем ориентацию, т.к. EXIF дальше стрипается.
  // autoCorrectionAngle по умолчанию true — впекаем ориентацию по EXIF (он
  // дальше стрипается хранилищем).
  final resized = await FlutterImageCompress.compressWithList(
    original,
    minWidth: 1600,
    minHeight: 1600,
    quality: 88,
  );

  return compute(_burnStamp, _StampRequest(bytes: resized, text: stampText));
}

class _StampRequest {
  const _StampRequest({required this.bytes, required this.text});

  final Uint8List bytes;
  final String text;
}

/// Рисует полупрозрачную плашку снизу и белый текст штампа. Выполняется в
/// изоляте (top-level), поэтому без доступа к UI/контексту.
Uint8List _burnStamp(_StampRequest req) {
  final decoded = img.decodeJpg(req.bytes);
  if (decoded == null) return req.bytes;

  // Точный таргет: ~1600px по БОЛЬШЕЙ стороне (flutter_image_compress
  // ограничивает по min-сторонам и точного контроля не даёт; досжимаем тут,
  // только вниз). Без апскейла мелких кадров.
  const maxSide = 1600;
  final longest = decoded.width > decoded.height
      ? decoded.width
      : decoded.height;
  final image = longest > maxSide
      ? img.copyResize(
          decoded,
          width: decoded.width >= decoded.height ? maxSide : null,
          height: decoded.height > decoded.width ? maxSide : null,
        )
      : decoded;

  final width = image.width;
  final height = image.height;
  final lines = req.text.split('\n');

  // Шрифт под размер кадра, чтобы штамп читался и на больших фото.
  final font = width >= 1200 ? img.arial48 : img.arial24;
  final lineHeight = font.lineHeight;
  const paddingX = 16;
  const paddingY = 12;
  final barHeight = lineHeight * lines.length + paddingY * 2;
  final barTop = (height - barHeight).clamp(0, height);

  img.fillRect(
    image,
    x1: 0,
    y1: barTop,
    x2: width,
    y2: height,
    color: img.ColorRgba8(0, 0, 0, 160),
  );

  final textColor = img.ColorRgb8(255, 255, 255);
  var y = barTop + paddingY;
  for (final line in lines) {
    img.drawString(
      image,
      line,
      font: font,
      x: paddingX,
      y: y,
      color: textColor,
    );
    y += lineHeight;
  }

  return img.encodeJpg(image, quality: 85);
}
