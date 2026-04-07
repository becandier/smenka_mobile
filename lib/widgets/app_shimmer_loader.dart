import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';

class AppShimmerLoader extends StatelessWidget {
  const AppShimmerLoader({
    this.itemCount = 5,
    this.itemBuilder,
    this.padding,
    super.key,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index)? itemBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final brightness = Theme.of(context).brightness;

    final baseColor = brightness == Brightness.light
        ? appColors.surface.withValues(alpha: 0.8)
        : appColors.surface;
    final highlightColor = brightness == Brightness.light
        ? appColors.background
        : appColors.secondary.withValues(alpha: 0.15);

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ListView.separated(
        padding: padding ?? const EdgeInsets.all(16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: itemBuilder ?? _defaultItemBuilder,
      ),
    );
  }

  Widget _defaultItemBuilder(BuildContext context, int index) {
    return _ShimmerPlaceholder(color: context.appColors.surface);
  }
}

class _ShimmerPlaceholder extends StatelessWidget {
  const _ShimmerPlaceholder({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const SizedBox(
        height: 72,
        width: double.infinity,
      ),
    );
  }
}
