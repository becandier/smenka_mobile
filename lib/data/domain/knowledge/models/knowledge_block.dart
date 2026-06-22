import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_block.freezed.dart';

/// Inline-фрагмент форматированного текста (rich span).
///
/// Неизвестные/несовместимые флаги игнорируем мягко. [link] — внешняя ссылка
/// (открывается во внешнем браузере), если задана.
@freezed
abstract class KnowledgeSpan with _$KnowledgeSpan {
  const factory KnowledgeSpan({
    required String text,
    @Default(false) bool bold,
    @Default(false) bool italic,
    @Default(false) bool underline,
    @Default(false) bool strike,
    @Default(false) bool code,
    String? link,
  }) = _KnowledgeSpan;
}

/// Блок контента страницы базы знаний (`schema_version=1`).
///
/// Sealed-диспетчер по полю `type`. Вариант [UnknownBlock] — обязательный
/// фолбэк для незнакомого `type` (бэк новее клиента / вырос `schema_version`):
/// рендерится плейсхолдером, остальные блоки продолжают рендериться.
///
/// У [ImageBlock]/[FileBlock] `url`/`urlExpiresAt` — nullable: сервер может
/// вернуть `url=null` при сбое storage, тогда свежая ссылка дотягивается по
/// `fileId` (через `StorageImage`/`FilesRepository`).
@freezed
sealed class KnowledgeBlock with _$KnowledgeBlock {
  const factory KnowledgeBlock.heading({
    required String id,
    required int level,
    required List<KnowledgeSpan> rich,
  }) = HeadingBlock;

  const factory KnowledgeBlock.paragraph({
    required String id,
    required List<KnowledgeSpan> rich,
  }) = ParagraphBlock;

  const factory KnowledgeBlock.bulletedList({
    required String id,
    required List<List<KnowledgeSpan>> items,
  }) = BulletedListBlock;

  const factory KnowledgeBlock.numberedList({
    required String id,
    required List<List<KnowledgeSpan>> items,
  }) = NumberedListBlock;

  const factory KnowledgeBlock.quote({
    required String id,
    required List<KnowledgeSpan> rich,
  }) = QuoteBlock;

  const factory KnowledgeBlock.callout({
    required String id,
    required List<KnowledgeSpan> rich,
    String? emoji,
  }) = CalloutBlock;

  const factory KnowledgeBlock.divider({required String id}) = DividerBlock;

  const factory KnowledgeBlock.image({
    required String id,
    required String fileId,
    String? url,
    DateTime? urlExpiresAt,
    String? caption,
  }) = ImageBlock;

  const factory KnowledgeBlock.file({
    required String id,
    required String fileId,
    required String filename,
    required int sizeBytes,
    String? url,
    DateTime? urlExpiresAt,
  }) = FileBlock;

  const factory KnowledgeBlock.video({
    required String id,
    required String provider,
    required String url,
    required String videoId,
  }) = VideoBlock;

  const factory KnowledgeBlock.table({
    required String id,
    required List<List<List<KnowledgeSpan>>> rows,
  }) = TableBlock;

  /// Фолбэк для неизвестного `type` — страница не падает.
  const factory KnowledgeBlock.unknown({
    required String id,
    required String rawType,
  }) = UnknownBlock;
}
