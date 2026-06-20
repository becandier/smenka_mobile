import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smenka_mobile/data/domain/checklist/_checklist.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Полноэкранный просмотр фото пункта: свайп-галерея с зумом/паном на `photo_view`,
/// подпись с временем/координатами и (на своей активной смене) удалением.
///
/// Семантика подписи зависит от источника: для `camera_or_gallery`
/// ([isAddedSemantics] = true) метки помечаются как «время/место добавления»,
/// а не съёмки (см. антифрод-границы в ТЗ). Удаление доступно, если передан
/// [onDeletePhoto]; на чужой/завершённой смене он `null`.
@RoutePage()
class ChecklistPhotoViewerPage extends StatefulWidget {
  const ChecklistPhotoViewerPage({
    required this.photos,
    required this.initialIndex,
    required this.isAddedSemantics,
    this.onDeletePhoto,
    super.key,
  });

  final List<ChecklistItemPhoto> photos;
  final int initialIndex;
  final bool isAddedSemantics;

  /// Удаляет фото и возвращает `true` при успехе. `null` на чужой/завершённой
  /// смене (удаление недоступно).
  final Future<bool> Function(String photoId)? onDeletePhoto;

  @override
  State<ChecklistPhotoViewerPage> createState() =>
      _ChecklistPhotoViewerPageState();
}

class _ChecklistPhotoViewerPageState extends State<ChecklistPhotoViewerPage> {
  static final DateFormat _format = DateFormat('dd.MM.yyyy HH:mm');

  late final List<ChecklistItemPhoto> _photos = [...widget.photos];
  late final PageController _pageController;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, _photos.length - 1);
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _deleteCurrent() async {
    final onDelete = widget.onDeletePhoto;
    if (onDelete == null || _photos.isEmpty) return;

    final confirmed = await _confirmDelete();
    if (confirmed != true || !mounted) return;

    final removed = _photos[_index];
    final deleted = await onDelete(removed.id);
    if (!mounted || !deleted) return;

    setState(() {
      _photos.removeWhere((p) => p.id == removed.id);
      if (_photos.isEmpty) return;
      _index = _index.clamp(0, _photos.length - 1);
    });

    if (_photos.isEmpty) {
      await context.router.maybePop();
    } else {
      _pageController.jumpToPage(_index);
    }
  }

  Future<bool?> _confirmDelete() {
    final l10n = context.l10n;
    return showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.checklistPhotoDeleteConfirmTitle),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(
              l10n.checklistPhotoDelete,
              style: const TextStyle(color: Colors.redAccent),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_photos.isEmpty) {
      return const Scaffold(backgroundColor: Colors.black);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.router.maybePop(),
        ),
        actions: [
          if (widget.onDeletePhoto != null)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _deleteCurrent,
            ),
        ],
      ),
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: _photos.length,
            pageController: _pageController,
            onPageChanged: (i) => setState(() => _index = i),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            builder: (context, i) {
              final photo = _photos[i];
              return PhotoViewGalleryPageOptions.customChild(
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2.5,
                heroAttributes: PhotoViewHeroAttributes(tag: photo.id),
                child: StorageImage(
                  fileId: photo.fileId,
                  initialUrl: photo.url,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _Caption(
              photo: _photos[_index],
              isAddedSemantics: widget.isAddedSemantics,
              formatter: _format,
            ),
          ),
        ],
      ),
    );
  }
}

class _Caption extends StatelessWidget {
  const _Caption({
    required this.photo,
    required this.isAddedSemantics,
    required this.formatter,
  });

  final ChecklistItemPhoto photo;
  final bool isAddedSemantics;
  final DateFormat formatter;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final capturedAt = photo.capturedAt;
    final latitude = photo.latitude;
    final longitude = photo.longitude;

    if (capturedAt == null && latitude == null) {
      return const SizedBox.shrink();
    }

    final dt = capturedAt == null
        ? null
        : formatter.format(capturedAt.toLocal());

    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Colors.black.withValues(alpha: 0.45),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (dt != null)
              Text(
                isAddedSemantics
                    ? l10n.checklistPhotoCaptionAdded(dt)
                    : l10n.checklistPhotoCaptionTaken(dt),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            if (latitude != null && longitude != null)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  l10n.checklistPhotoCaptionCoords(
                    latitude.toStringAsFixed(5),
                    longitude.toStringAsFixed(5),
                  ),
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
