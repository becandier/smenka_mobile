import 'package:flutter/material.dart';
import 'package:smenka_mobile/widgets/app_shimmer_loader.dart';

class SectionLoader extends StatelessWidget {
  const SectionLoader({this.loadingBuilder, super.key});

  final Widget Function()? loadingBuilder;

  @override
  Widget build(BuildContext context) {
    return loadingBuilder?.call() ?? const AppShimmerLoader();
  }
}
