import 'package:flutter/material.dart';

class SectionLoader extends StatelessWidget {
  const SectionLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
