part of 'knowledge_page_screen.dart';

/// Диспетчер рендера блока по sealed-типу. Незнакомый тип ([UnknownBlock]) →
/// плейсхолдер; остальные блоки рендерятся независимо.
class _BlockView extends StatelessWidget {
  const _BlockView({required this.block});

  final KnowledgeBlock block;

  @override
  Widget build(BuildContext context) {
    return switch (block) {
      final HeadingBlock b => _HeadingBlockView(block: b),
      final ParagraphBlock b => _RichText(
        spans: b.rich,
        baseStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      final BulletedListBlock b => _ListBlockView(
        items: b.items,
        ordered: false,
      ),
      final NumberedListBlock b => _ListBlockView(
        items: b.items,
        ordered: true,
      ),
      final QuoteBlock b => _QuoteBlockView(block: b),
      final CalloutBlock b => _CalloutBlockView(block: b),
      DividerBlock _ => const _DividerBlockView(),
      final ImageBlock b => _ImageBlockView(block: b),
      final FileBlock b => _FileBlockView(block: b),
      final VideoBlock b => _VideoBlockView(block: b),
      final TableBlock b => _TableBlockView(block: b),
      UnknownBlock _ => const _UnsupportedBlockView(),
    };
  }
}

class _HeadingBlockView extends StatelessWidget {
  const _HeadingBlockView({required this.block});

  final HeadingBlock block;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final base = switch (block.level) {
      1 => textTheme.headlineSmall,
      2 => textTheme.titleLarge,
      _ => textTheme.titleMedium,
    };
    return _RichText(
      spans: block.rich,
      baseStyle: base?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _ListBlockView extends StatelessWidget {
  const _ListBlockView({required this.items, required this.ordered});

  final List<List<KnowledgeSpan>> items;
  final bool ordered;

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).textTheme.bodyLarge;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 26,
                  child: Text(ordered ? '${i + 1}.' : '•', style: base),
                ),
                Expanded(
                  child: _RichText(spans: items[i], baseStyle: base),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _QuoteBlockView extends StatelessWidget {
  const _QuoteBlockView({required this.block});

  final QuoteBlock block;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final base = Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontStyle: FontStyle.italic,
      color: appColors.secondary,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: appColors.primary, width: 3)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
        child: _RichText(spans: block.rich, baseStyle: base),
      ),
    );
  }
}

class _CalloutBlockView extends StatelessWidget {
  const _CalloutBlockView({required this.block});

  final CalloutBlock block;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final emoji = block.emoji;

    return Material(
      color: appColors.info.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (emoji != null && emoji.isNotEmpty) ...[
              Text(emoji, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: _RichText(
                spans: block.rich,
                baseStyle: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DividerBlockView extends StatelessWidget {
  const _DividerBlockView();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 24,
      color: context.appColors.secondary.withValues(alpha: 0.2),
    );
  }
}

class _ImageBlockView extends StatelessWidget {
  const _ImageBlockView({required this.block});

  final ImageBlock block;

  @override
  Widget build(BuildContext context) {
    final caption = block.caption;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StorageImage(
          fileId: block.fileId,
          initialUrl: block.url,
          width: double.infinity,
          height: 220,
          borderRadius: BorderRadius.circular(12),
        ),
        if (caption != null && caption.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            caption,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: context.appColors.secondary),
          ),
        ],
      ],
    );
  }
}

class _FileBlockView extends StatefulWidget {
  const _FileBlockView({required this.block});

  final FileBlock block;

  @override
  State<_FileBlockView> createState() => _FileBlockViewState();
}

class _FileBlockViewState extends State<_FileBlockView> {
  bool _opening = false;

  Future<void> _open() async {
    if (_opening) return;

    // presigned url короткоживущий, а внешний launchUrl не сигнализирует о
    // протухании (403/404), поэтому всегда тянем свежий по fileId перед
    // открытием — как StorageImage для картинок (доверяем fileId, не url).
    setState(() => _opening = true);
    final repository = context.read<FilesRepository>();
    final task = await repository.getFile(widget.block.fileId);
    if (!mounted) return;
    setState(() => _opening = false);
    task.fold(
      onSuccess: (file) => _launchOrWarn(file.url),
      onFailure: (error) => context.modals.showError(
        localizedErrorMessage(
          context,
          code: error.code,
          fallback: error.message,
        ),
      ),
    );
  }

  Future<void> _launchOrWarn(String url) async {
    final ok = await _launchExternal(url);
    if (!ok && mounted) {
      context.modals.showError(context.l10n.errorStorageUnavailable);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _open,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Icon(Icons.insert_drive_file_outlined, color: appColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.block.filename,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _formatBytes(widget.block.sizeBytes),
                      style: textTheme.bodySmall?.copyWith(
                        color: appColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (_opening)
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                )
              else
                Icon(
                  Icons.download_outlined,
                  size: 20,
                  color: appColors.secondary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VideoBlockView extends StatelessWidget {
  const _VideoBlockView({required this.block});

  final VideoBlock block;

  Future<void> _openVideo(BuildContext context, String url) async {
    final ok = await _launchExternal(url);
    if (!ok && context.mounted) {
      context.modals.showError(context.l10n.errorOccurred);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final l10n = context.l10n;
    final videoId = block.videoId;
    final hasUrl = block.url.isNotEmpty;
    final thumbUrl = videoId.isNotEmpty
        ? 'https://img.youtube.com/vi/$videoId/hqdefault.jpg'
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: GestureDetector(
              onTap: hasUrl ? () => _openVideo(context, block.url) : null,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (thumbUrl != null)
                    CachedNetworkImage(
                      imageUrl: thumbUrl,
                      fit: BoxFit.cover,
                      placeholder: (_, __) =>
                          ColoredBox(color: appColors.surface),
                      errorWidget: (_, __, ___) =>
                          ColoredBox(color: appColors.surface),
                    )
                  else
                    ColoredBox(color: appColors.surface),
                  const Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      size: 56,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (hasUrl) ...[
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => _openVideo(context, block.url),
              icon: const Icon(Icons.open_in_new, size: 18),
              label: Text(l10n.knowledgeOpenYoutube),
            ),
          ),
        ],
      ],
    );
  }
}

class _TableBlockView extends StatelessWidget {
  const _TableBlockView({required this.block});

  final TableBlock block;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final base = Theme.of(context).textTheme.bodyMedium;
    final columnCount = block.rows.fold<int>(
      0,
      (max, row) => row.length > max ? row.length : max,
    );
    if (columnCount == 0) return const SizedBox.shrink();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.sizeOf(context).width - 32,
        ),
        child: Table(
          border: TableBorder.all(
            color: appColors.secondary.withValues(alpha: 0.3),
          ),
          defaultColumnWidth: const IntrinsicColumnWidth(),
          children: [
            for (final row in block.rows)
              TableRow(
                children: [
                  for (var c = 0; c < columnCount; c++)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: _RichText(
                        spans: c < row.length ? row[c] : const [],
                        baseStyle: base,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _UnsupportedBlockView extends StatelessWidget {
  const _UnsupportedBlockView();

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Material(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(Icons.help_outline, size: 20, color: appColors.secondary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                context.l10n.knowledgeBlockUnsupported,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: appColors.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Inline rich text с поддержкой bold/italic/underline/strike/code/link.
/// Управляет жизненным циклом [TapGestureRecognizer] для ссылок.
class _RichText extends StatefulWidget {
  const _RichText({required this.spans, this.baseStyle});

  final List<KnowledgeSpan> spans;
  final TextStyle? baseStyle;

  @override
  State<_RichText> createState() => _RichTextState();
}

class _RichTextState extends State<_RichText> {
  final List<TapGestureRecognizer> _recognizers = [];

  void _disposeRecognizers() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    _recognizers.clear();
  }

  @override
  void dispose() {
    _disposeRecognizers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final base =
        widget.baseStyle ??
        Theme.of(context).textTheme.bodyMedium ??
        const TextStyle();

    _disposeRecognizers();
    final children = widget.spans
        .map((span) => _buildSpan(span, base, appColors))
        .toList();

    return Text.rich(TextSpan(children: children));
  }

  InlineSpan _buildSpan(KnowledgeSpan span, TextStyle base, AppColors colors) {
    var style = base;
    if (span.bold) style = style.copyWith(fontWeight: FontWeight.bold);
    if (span.italic) style = style.copyWith(fontStyle: FontStyle.italic);

    final decorations = <TextDecoration>[];
    if (span.underline) decorations.add(TextDecoration.underline);
    if (span.strike) decorations.add(TextDecoration.lineThrough);
    if (decorations.isNotEmpty) {
      style = style.copyWith(decoration: TextDecoration.combine(decorations));
    }
    if (span.code) {
      style = style.copyWith(
        fontFamily: 'monospace',
        backgroundColor: colors.surface,
      );
    }

    final link = span.link;
    if (link != null && link.isNotEmpty) {
      style = style.copyWith(
        color: colors.primary,
        decoration: TextDecoration.underline,
      );
      final recognizer = TapGestureRecognizer()
        ..onTap = () => _launchExternal(link);
      _recognizers.add(recognizer);
      return TextSpan(text: span.text, style: style, recognizer: recognizer);
    }

    return TextSpan(text: span.text, style: style);
  }
}

String _formatBytes(int bytes) {
  if (bytes < 1024) return '$bytes Б';
  if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} КБ';
  if (bytes < 1024 * 1024 * 1024) {
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} МБ';
  }
  return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} ГБ';
}

Future<bool> _launchExternal(String url) async {
  final uri = Uri.tryParse(url);
  if (uri == null) return false;
  try {
    return await launchUrl(uri, mode: LaunchMode.externalApplication);
  } on Exception {
    return false;
  }
}
