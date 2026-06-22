import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';
import 'package:smenka_mobile/data/infrastructure/knowledge/datasource/dto/_dto.dart';
import 'package:smenka_mobile/data/infrastructure/knowledge/mappers/knowledge_mapper.dart';

Map<String, dynamic> _detailJson({
  List<dynamic>? content,
  String kind = 'page',
}) {
  return {
    'id': 'p1',
    'parent_id': 's1',
    'kind': kind,
    'title': 'Открытие точки',
    'icon': '📋',
    'position': 0,
    'all_members': false,
    'created_at': '2026-06-22T08:00:00Z',
    'updated_at': '2026-06-22T09:00:00Z',
    'breadcrumbs': [
      {'id': 's1', 'title': 'Регламенты'},
      {'id': 'p1', 'title': 'Открытие точки'},
    ],
    'content': content,
  };
}

void main() {
  group('KnowledgeNodeDto (дерево) → toDomain', () {
    test('переносит поля, парсит kind, рекурсивно мапит children', () {
      final node = KnowledgeNodeDto.fromJson({
        'id': 's1',
        'kind': 'section',
        'title': 'Регламенты',
        'icon': '📁',
        'position': 0,
        'all_members': true,
        'children': [
          {
            'id': 'p1',
            'kind': 'page',
            'title': 'Открытие',
            'position': 0,
            'all_members': false,
            'children': <dynamic>[],
          },
          {
            'id': 'x1',
            'kind': 'mystery',
            'title': '?',
            'position': 1,
            'children': <dynamic>[],
          },
        ],
      }).toDomain();

      expect(node.id, 's1');
      expect(node.kind, KnowledgeNodeKind.section);
      expect(node.isSection, isTrue);
      expect(node.icon, '📁');
      expect(node.allMembers, isTrue);
      expect(node.children, hasLength(2));
      expect(node.children[0].kind, KnowledgeNodeKind.page);
      expect(node.children[0].isPage, isTrue);
      // Незнакомый kind → безопасный фолбэк unknown (forward-compat).
      expect(node.children[1].kind, KnowledgeNodeKind.unknown);
    });

    test('all_members отсутствует (employee) → allMembers == null', () {
      final node = KnowledgeNodeDto.fromJson({
        'id': 'p1',
        'kind': 'page',
        'title': 'Стр',
        'position': 0,
      }).toDomain();

      expect(node.allMembers, isNull);
      expect(node.children, isEmpty);
    });
  });

  group('KnowledgeNodeDetailDto → toDomain (блоки)', () {
    test('section: content = null', () {
      final detail = KnowledgeNodeDetailDto.fromJson(
        _detailJson(kind: 'section'),
      ).toDomain();

      expect(detail.kind, KnowledgeNodeKind.section);
      expect(detail.content, isNull);
      expect(detail.breadcrumbs, hasLength(2));
      expect(detail.breadcrumbs.first.title, 'Регламенты');
      expect(detail.createdAt.isUtc, isTrue);
    });

    test('page: пустой content (content == [])', () {
      final detail = KnowledgeNodeDetailDto.fromJson(
        _detailJson(content: const []),
      ).toDomain();

      expect(detail.content, isNotNull);
      expect(detail.content, isEmpty);
    });

    test('диспетчер по type разбирает все 11 типов блоков', () {
      final detail = KnowledgeNodeDetailDto.fromJson(
        _detailJson(
          content: [
            {
              'id': 'b1',
              'type': 'heading',
              'level': 2,
              'rich': [
                {'text': 'Заголовок', 'bold': true},
              ],
            },
            {
              'id': 'b2',
              'type': 'paragraph',
              'rich': [
                {'text': 'абзац '},
                {'text': 'ссылка', 'link': 'https://x', 'italic': true},
              ],
            },
            {
              'id': 'b3',
              'type': 'bulleted_list',
              'items': [
                [
                  {'text': 'один'},
                ],
                [
                  {'text': 'два'},
                ],
              ],
            },
            {
              'id': 'b4',
              'type': 'numbered_list',
              'items': [
                [
                  {'text': 'a'},
                ],
              ],
            },
            {
              'id': 'b5',
              'type': 'quote',
              'rich': [
                {'text': 'цитата'},
              ],
            },
            {
              'id': 'b6',
              'type': 'callout',
              'emoji': '💡',
              'rich': [
                {'text': 'выноска'},
              ],
            },
            {'id': 'b7', 'type': 'divider'},
            {
              'id': 'b8',
              'type': 'image',
              'file_id': 'f1',
              'caption': 'подпись',
              'url': null,
              'url_expires_at': null,
            },
            {
              'id': 'b9',
              'type': 'file',
              'file_id': 'f2',
              'filename': 'doc.pdf',
              'size_bytes': 2048,
              'url': 'https://u',
              'url_expires_at': '2026-06-22T10:00:00Z',
            },
            {
              'id': 'b10',
              'type': 'video',
              'provider': 'youtube',
              'url': 'https://youtu.be/abc',
              'video_id': 'abc',
            },
            {
              'id': 'b11',
              'type': 'table',
              'rows': [
                [
                  [
                    {'text': 'A'},
                  ],
                  [
                    {'text': 'B'},
                  ],
                ],
                [
                  [
                    {'text': 'C'},
                  ],
                  [
                    {'text': 'D'},
                  ],
                ],
              ],
            },
          ],
        ),
      ).toDomain();

      final blocks = detail.content!;
      expect(blocks, hasLength(11));

      final heading = blocks[0] as HeadingBlock;
      expect(heading.level, 2);
      expect(heading.rich.single.text, 'Заголовок');
      expect(heading.rich.single.bold, isTrue);

      final paragraph = blocks[1] as ParagraphBlock;
      expect(paragraph.rich, hasLength(2));
      expect(paragraph.rich[1].link, 'https://x');
      expect(paragraph.rich[1].italic, isTrue);

      final bulleted = blocks[2] as BulletedListBlock;
      expect(bulleted.items, hasLength(2));
      expect(bulleted.items[0].single.text, 'один');

      expect(blocks[3], isA<NumberedListBlock>());
      expect(blocks[4], isA<QuoteBlock>());

      final callout = blocks[5] as CalloutBlock;
      expect(callout.emoji, '💡');

      expect(blocks[6], isA<DividerBlock>());

      final image = blocks[7] as ImageBlock;
      expect(image.fileId, 'f1');
      expect(image.url, isNull);
      expect(image.caption, 'подпись');

      final file = blocks[8] as FileBlock;
      expect(file.filename, 'doc.pdf');
      expect(file.sizeBytes, 2048);
      expect(file.url, 'https://u');
      expect(file.urlExpiresAt?.isUtc, isTrue);

      final video = blocks[9] as VideoBlock;
      expect(video.videoId, 'abc');

      final table = blocks[10] as TableBlock;
      expect(table.rows, hasLength(2));
      expect(table.rows[0], hasLength(2));
      expect(table.rows[0][0].single.text, 'A');
    });

    test('неизвестный type → UnknownBlock (страница не падает)', () {
      final detail = KnowledgeNodeDetailDto.fromJson(
        _detailJson(
          content: [
            {'id': 'b1', 'type': 'super_new_block', 'foo': 'bar'},
            {
              'id': 'b2',
              'type': 'paragraph',
              'rich': [
                {'text': 'ещё рендерится'},
              ],
            },
          ],
        ),
      ).toDomain();

      final blocks = detail.content!;
      final unknown = blocks[0] as UnknownBlock;
      expect(unknown.rawType, 'super_new_block');
      // Остальные блоки продолжают разбираться.
      expect(blocks[1], isA<ParagraphBlock>());
    });

    test('битый rich/items не роняет маппер (мягкая деградация)', () {
      final detail = KnowledgeNodeDetailDto.fromJson(
        _detailJson(
          content: [
            {'id': 'b1', 'type': 'paragraph', 'rich': 'не массив'},
            {'id': 'b2', 'type': 'bulleted_list'},
          ],
        ),
      ).toDomain();

      final paragraph = detail.content![0] as ParagraphBlock;
      expect(paragraph.rich, isEmpty);
      final list = detail.content![1] as BulletedListBlock;
      expect(list.items, isEmpty);
    });
  });
}
