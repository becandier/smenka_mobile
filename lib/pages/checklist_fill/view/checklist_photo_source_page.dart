import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/checklist_fill/cubit/checklist_photo_draft.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Bottom-sheet выбора источника фото для `camera_or_gallery`. Возвращает
/// выбранный [PhotoCaptureSource] через `maybePop`, либо `null` при закрытии.
@RoutePage()
class ChecklistPhotoSourcePage extends StatelessWidget {
  const ChecklistPhotoSourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.appColors;

    return AppBottomSheet(
      title: l10n.checklistPhotoSourceTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.photo_camera_outlined, color: colors.primary),
            title: Text(l10n.checklistPhotoTakePhoto),
            onTap: () => context.router.maybePop(PhotoCaptureSource.camera),
          ),
          ListTile(
            leading: Icon(Icons.photo_library_outlined, color: colors.primary),
            title: Text(l10n.checklistPhotoChooseGallery),
            onTap: () => context.router.maybePop(PhotoCaptureSource.gallery),
          ),
        ],
      ),
    );
  }
}
