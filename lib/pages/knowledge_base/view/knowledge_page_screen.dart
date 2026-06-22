import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/core/router/app_modals.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/file_storage/_file_storage.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/knowledge_base/cubit/knowledge_page_cubit.dart';
import 'package:smenka_mobile/pages/knowledge_base/cubit/knowledge_page_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

part 'knowledge_blocks.dart';

/// Экран страницы базы знаний — нативный рендер блоков (org_member, read-only).
/// Открывается только для `kind=page`; разделы ведут на под-дерево.
@RoutePage(name: 'KnowledgePageRoute')
class KnowledgePageScreen extends StatelessWidget {
  const KnowledgePageScreen({
    @pathParam required this.orgId,
    @pathParam required this.nodeId,
    this.initialTitle,
    super.key,
  });

  final String orgId;
  final String nodeId;

  /// Заголовок узла из дерева — мгновенно показывается в AppBar до загрузки.
  final String? initialTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KnowledgePageCubit(
        orgId: orgId,
        nodeId: nodeId,
        knowledgeRepository: context.read<KnowledgeRepository>(),
      ),
      child: _KnowledgePageView(initialTitle: initialTitle),
    );
  }
}

class _KnowledgePageView extends StatelessWidget {
  const _KnowledgePageView({this.initialTitle});

  final String? initialTitle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BlocSelector<KnowledgePageCubit, KnowledgePageState, String?>(
          selector: (state) => state.node.data?.title,
          builder: (context, title) =>
              Text(title ?? initialTitle ?? l10n.knowledgeBaseTitle),
        ),
      ),
      body:
          SectionDataWrapper<
            KnowledgePageCubit,
            KnowledgePageState,
            KnowledgeNodeDetail
          >(
            selector: (state) => state.node,
            onRetry: () => context.read<KnowledgePageCubit>().load(),
            contentBuilder: (detail) => _ArticleBody(detail: detail),
          ),
    );
  }
}

class _ArticleBody extends StatelessWidget {
  const _ArticleBody({required this.detail});

  final KnowledgeNodeDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final content = detail.content ?? const <KnowledgeBlock>[];

    return RefreshIndicator.adaptive(
      onRefresh: () => context.read<KnowledgePageCubit>().load(),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: 32,
        ),
        children: [
          if (detail.breadcrumbs.isNotEmpty) ...[
            _Breadcrumbs(crumbs: detail.breadcrumbs),
            const SizedBox(height: 16),
          ],
          if (content.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 64),
              child: AppEmptyState(
                icon: Icons.description_outlined,
                title: l10n.knowledgePageEmpty,
              ),
            )
          else
            for (final block in content)
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _BlockView(block: block),
              ),
        ],
      ),
    );
  }
}

class _Breadcrumbs extends StatelessWidget {
  const _Breadcrumbs({required this.crumbs});

  final List<KnowledgeBreadcrumb> crumbs;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final style = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: appColors.secondary);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < crumbs.length; i++) ...[
            if (i > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  Icons.chevron_right,
                  size: 14,
                  color: appColors.secondary,
                ),
              ),
            Text(
              crumbs[i].title,
              style: i == crumbs.length - 1
                  ? style?.copyWith(fontWeight: FontWeight.w600)
                  : style,
            ),
          ],
        ],
      ),
    );
  }
}
