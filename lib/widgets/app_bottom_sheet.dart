import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';

/// Простой bottom sheet с поддержкой клавиатуры и скролла.
/// Автоматически подстраивается под размер контента.
///
/// Используется как обёртка для контента внутри modal bottom sheet.
class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    required this.child,
    this.title,
    this.showDragHandle = true,
    this.padding,
    super.key,
  });

  final Widget child;
  final String? title;
  final bool showDragHandle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final colors = context.appColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding:
              padding ??
              EdgeInsets.only(
                left: 16,
                right: 16,
                top: showDragHandle ? 0 : 24,
                bottom: 24 + bottomInset,
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showDragHandle) _buildDragHandle(context),
              if (title != null) ...[
                const SizedBox(height: 16),
                Text(
                  title!,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
              if (showDragHandle || title != null) const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.appColors.secondary.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const SizedBox(width: 40, height: 4),
        ),
      ),
    );
  }
}
