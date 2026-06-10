import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/section_data.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/widgets/section_data/section_error.dart';
import 'package:smenka_mobile/widgets/section_data/section_loader.dart';

class SectionDataWrapper<C extends StateStreamable<S>, S, T>
    extends StatelessWidget {
  const SectionDataWrapper({
    required this.selector,
    required this.contentBuilder,
    required this.onRetry,
    this.emptyBuilder,
    this.loadingBuilder,
    super.key,
  });

  final SectionData<T> Function(S state) selector;
  final Widget Function(T data) contentBuilder;
  final VoidCallback onRetry;
  final Widget Function()? emptyBuilder;
  final Widget Function()? loadingBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<C, S, SectionData<T>>(
      selector: selector,
      builder: (context, sectionData) {
        if (sectionData.isLoading) {
          return SectionLoader(loadingBuilder: loadingBuilder);
        }

        if (sectionData.error case final errorMessage?) {
          // Известный error.code → локализованный текст; иначе — сообщение
          // бэка как фолбэк (см. docs/ERROR_FORMAT.md).
          return SectionError(
            error: localizedErrorMessage(
              context,
              code: sectionData.errorCode,
              fallback: errorMessage,
            ),
            onRetry: onRetry,
          );
        }

        if (!sectionData.hasData) {
          return emptyBuilder?.call() ?? const SizedBox.shrink();
        }

        final data = sectionData.data as T;

        return contentBuilder(data);
      },
    );
  }
}
