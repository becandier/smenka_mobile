import 'package:smenka_mobile/data/domain/knowledge/models/_models.dart';
import 'package:smenka_mobile/data/infrastructure/knowledge/datasource/dto/_dto.dart';

extension KnowledgeNodeDtoMapper on KnowledgeNodeDto {
  KnowledgeNode toDomain() => KnowledgeNode(
    id: id,
    kind: _parseKind(kind),
    title: title,
    position: position,
    icon: icon,
    allMembers: allMembers,
    children: children.map((child) => child.toDomain()).toList(),
  );
}

extension KnowledgeBreadcrumbDtoMapper on KnowledgeBreadcrumbDto {
  KnowledgeBreadcrumb toDomain() => KnowledgeBreadcrumb(id: id, title: title);
}

extension KnowledgeNodeDetailDtoMapper on KnowledgeNodeDetailDto {
  KnowledgeNodeDetail toDomain() => KnowledgeNodeDetail(
    id: id,
    kind: _parseKind(kind),
    title: title,
    position: position,
    allMembers: allMembers,
    createdAt: createdAt.toUtc(),
    updatedAt: updatedAt.toUtc(),
    parentId: parentId,
    icon: icon,
    content: content?.whereType<Map<String, dynamic>>().map(_mapBlock).toList(),
    breadcrumbs: breadcrumbs.map((crumb) => crumb.toDomain()).toList(),
  );
}

KnowledgeNodeKind _parseKind(String value) => switch (value) {
  'section' => KnowledgeNodeKind.section,
  'page' => KnowledgeNodeKind.page,
  _ => KnowledgeNodeKind.unknown,
};

/// Диспетчер по полю `type`. Незнакомый тип → [UnknownBlock] (forward-compat,
/// страница не падает). Все ключи блока — сырые snake_case из JSON.
KnowledgeBlock _mapBlock(Map<String, dynamic> json) {
  final id = json['id'] as String? ?? '';
  final type = json['type'] as String? ?? '';

  return switch (type) {
    'heading' => KnowledgeBlock.heading(
      id: id,
      // Контракт BLOCK SCHEMA: level ∈ {1,2,3} — клампим инвариант.
      level: ((json['level'] as num?)?.toInt() ?? 1).clamp(1, 3),
      rich: _mapRich(json['rich']),
    ),
    'paragraph' => KnowledgeBlock.paragraph(
      id: id,
      rich: _mapRich(json['rich']),
    ),
    'bulleted_list' => KnowledgeBlock.bulletedList(
      id: id,
      items: _mapItems(json['items']),
    ),
    'numbered_list' => KnowledgeBlock.numberedList(
      id: id,
      items: _mapItems(json['items']),
    ),
    'quote' => KnowledgeBlock.quote(id: id, rich: _mapRich(json['rich'])),
    'callout' => KnowledgeBlock.callout(
      id: id,
      emoji: json['emoji'] as String?,
      rich: _mapRich(json['rich']),
    ),
    'divider' => KnowledgeBlock.divider(id: id),
    'image' => KnowledgeBlock.image(
      id: id,
      fileId: json['file_id'] as String? ?? '',
      url: json['url'] as String?,
      urlExpiresAt: _parseDate(json['url_expires_at']),
      caption: json['caption'] as String?,
    ),
    'file' => KnowledgeBlock.file(
      id: id,
      fileId: json['file_id'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
      sizeBytes: (json['size_bytes'] as num?)?.toInt() ?? 0,
      url: json['url'] as String?,
      urlExpiresAt: _parseDate(json['url_expires_at']),
    ),
    'video' => KnowledgeBlock.video(
      id: id,
      provider: json['provider'] as String? ?? 'youtube',
      url: json['url'] as String? ?? '',
      videoId: json['video_id'] as String? ?? '',
    ),
    'table' => KnowledgeBlock.table(id: id, rows: _mapRows(json['rows'])),
    _ => KnowledgeBlock.unknown(id: id, rawType: type),
  };
}

/// `rich`/`cell` = массив span.
List<KnowledgeSpan> _mapRich(dynamic raw) {
  if (raw is! List) return const [];
  return raw.whereType<Map<String, dynamic>>().map(_mapSpan).toList();
}

/// `items` = массив пунктов, каждый пункт — массив span.
List<List<KnowledgeSpan>> _mapItems(dynamic raw) {
  if (raw is! List) return const [];
  return raw.whereType<List<dynamic>>().map(_mapRich).toList();
}

/// `rows` = массив строк, строка — массив ячеек, ячейка — массив span.
List<List<List<KnowledgeSpan>>> _mapRows(dynamic raw) {
  if (raw is! List) return const [];
  return raw.whereType<List<dynamic>>().map(_mapItems).toList();
}

KnowledgeSpan _mapSpan(Map<String, dynamic> json) => KnowledgeSpan(
  text: json['text'] as String? ?? '',
  bold: json['bold'] as bool? ?? false,
  italic: json['italic'] as bool? ?? false,
  underline: json['underline'] as bool? ?? false,
  strike: json['strike'] as bool? ?? false,
  code: json['code'] as bool? ?? false,
  link: json['link'] as String?,
);

DateTime? _parseDate(dynamic raw) {
  if (raw is! String) return null;
  return DateTime.tryParse(raw)?.toUtc();
}
