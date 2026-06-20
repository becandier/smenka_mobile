import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';

/// Показ файла из единого хранилища (`file_storage`) по стабильному [fileId].
///
/// presigned-ссылки живут недолго, поэтому виджет хранит `fileId`, а не URL:
/// если переданный [initialUrl] протух (storage вернул 403/404), он один раз
/// запрашивает свежую ссылку через [FilesRepository.getFile] и повторяет показ.
/// Картинки кешируются (`CachedNetworkImage`).
///
/// Использование: `StorageImage(fileId: id, initialUrl: file.url)`. Репозиторий
/// берётся из контекста (`context.read<FilesRepository>()`), он зарегистрирован
/// глобально в `success_app`.
class StorageImage extends StatefulWidget {
  const StorageImage({
    required this.fileId,
    this.initialUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    super.key,
  });

  final String fileId;

  /// Уже известная ссылка (напр. из payload сущности-потребителя). Если `null`
  /// или протухла — будет запрошена свежая по [fileId].
  final String? initialUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  State<StorageImage> createState() => _StorageImageState();
}

class _StorageImageState extends State<StorageImage> {
  String? _url;
  bool _refreshing = false;
  bool _failed = false;

  /// Ссылки, по которым уже была попытка авто-обновления — чтобы не
  /// зациклиться, если файл реально удалён, а не просто протух.
  final Set<String> _retriedUrls = {};

  @override
  void initState() {
    super.initState();
    _url = widget.initialUrl;
    if (_url == null) _refreshUrl();
  }

  @override
  void didUpdateWidget(StorageImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fileId != widget.fileId) {
      _retriedUrls.clear();
      _failed = false;
      _url = widget.initialUrl;
      if (_url == null) _refreshUrl();
    }
  }

  Future<void> _refreshUrl() async {
    if (_refreshing) return;
    setState(() {
      _refreshing = true;
      _failed = false;
    });

    final result = await context.read<FilesRepository>().getFile(widget.fileId);
    if (!mounted) return;

    result.fold(
      onSuccess: (file) => setState(() {
        _url = file.url;
        _refreshing = false;
      }),
      onFailure: (_) => setState(() {
        _refreshing = false;
        _failed = true;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget content;
    final url = _url;

    if (url == null) {
      content = _failed
          ? _StorageImageError(onRetry: _refreshUrl)
          : const _StorageImagePlaceholder();
    } else {
      content = CachedNetworkImage(
        imageUrl: url,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
        placeholder: (_, __) => const _StorageImagePlaceholder(),
        errorWidget: (_, failedUrl, __) {
          // Протухшая ссылка → один раз дёргаем свежую и показываем загрузку.
          if (!_refreshing && !_retriedUrls.contains(failedUrl)) {
            _retriedUrls.add(failedUrl);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) _refreshUrl();
            });
            return const _StorageImagePlaceholder();
          }
          return _StorageImageError(onRetry: _refreshUrl);
        },
      );
    }

    final sized = SizedBox(
      width: widget.width,
      height: widget.height,
      child: content,
    );

    final radius = widget.borderRadius;
    if (radius == null) return sized;
    return ClipRRect(borderRadius: radius, child: sized);
  }
}

class _StorageImagePlaceholder extends StatelessWidget {
  const _StorageImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Shimmer.fromColors(
      baseColor: appColors.surface,
      highlightColor: appColors.background,
      child: ColoredBox(
        color: appColors.surface,
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _StorageImageError extends StatelessWidget {
  const _StorageImageError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return ColoredBox(
      color: appColors.surface,
      child: Center(
        child: IconButton(
          icon: Icon(Icons.refresh, color: appColors.secondary),
          onPressed: onRetry,
        ),
      ),
    );
  }
}
