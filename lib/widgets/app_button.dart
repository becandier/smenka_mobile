import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.label,
    this.isLoading = false,
    this.isEnabled = true,
    this.isOutlined = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final bool isEnabled;
  final bool isOutlined;

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator.adaptive(strokeWidth: 2),
          )
        : Text(label);

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
