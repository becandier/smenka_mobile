import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/services/geo_service.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/geo_diagnostics/cubit/geo_diagnostics_cubit.dart';
import 'package:smenka_mobile/pages/geo_diagnostics/cubit/geo_diagnostics_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

part '../widgets/_status_section.dart';
part '../widgets/_test_section.dart';
part '../widgets/_instructions_section.dart';

/// Страница «Проверка геолокации» (`geo_troubleshooting`, сценарий 2).
///
/// Точки входа: кнопка «Как исправить» в [GeoFailureDialog] на старте смены и
/// пункт в настройках профиля. Экран полностью клиентский — сеть не трогает.
@RoutePage()
class GeoDiagnosticsPage extends StatelessWidget {
  const GeoDiagnosticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GeoDiagnosticsCubit(geoService: GeoService()),
      child: const _GeoDiagnosticsView(),
    );
  }
}

class _GeoDiagnosticsView extends StatelessWidget {
  const _GeoDiagnosticsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.geoDiagnosticsTitle), centerTitle: true),
      body: SafeArea(
        child: BlocBuilder<GeoDiagnosticsCubit, GeoDiagnosticsState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 32,
              ),
              children: [
                _StatusSection(state: state),
                const SizedBox(height: 24),
                _TestSection(state: state),
                const SizedBox(height: 24),
                _InstructionsSection(state: state),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Заголовок блока страницы.
class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

/// Карточка-контейнер блока (единый фон/скругление на всей странице).
class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.appColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}
