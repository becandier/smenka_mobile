import 'package:flutter/material.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';

/// Компактная строка «📍 <название точки>» приглушённым цветом.
///
/// Переиспользуется в карточках смен (история, орг-смены) для показа рабочей
/// точки смены, когда она задана. Сжимается по ширине (ellipsis).
class WorkLocationLine extends StatelessWidget {
  const WorkLocationLine({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(Icons.place_outlined, size: 13, color: colors.secondary),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodySmall?.copyWith(color: colors.secondary),
          ),
        ),
      ],
    );
  }
}
