import 'package:flutter/material.dart';

class DevModeBannerWrapper extends StatelessWidget {
  const DevModeBannerWrapper({
    required this.isDevMode,
    required this.child,
    super.key,
  });

  final bool isDevMode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!isDevMode) {
      return child;
    }

    return Stack(
      children: [
        child,
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Material(
            color: Colors.red.withValues(alpha: 0.65),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.developer_mode, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'DEV MODE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
