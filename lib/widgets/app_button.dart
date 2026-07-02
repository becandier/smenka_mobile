import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.isEnabled = true,
    this.isOutlined = false,
    this.icon,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final bool isEnabled;
  final bool isOutlined;

  /// Иконка слева от текста (напр. лого провайдера в OAuth-кнопке)
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final child = switch ((isLoading, icon)) {
      (true, _) => const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator.adaptive(strokeWidth: 2),
      ),
      (false, null) => Text(label),
      (false, final icon?) => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, const SizedBox(width: 8), Text(label)],
      ),
    };

    final callback = isEnabled && !isLoading ? onPressed : null;

    if (isOutlined) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(onPressed: callback, child: child),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: callback, child: child),
    );
  }
}
