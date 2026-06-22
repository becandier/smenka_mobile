import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/router/app_router.dart';
import 'package:smenka_mobile/core/theme/colors/app_colors.dart.dart';
import 'package:smenka_mobile/data/domain/knowledge/_knowledge.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/knowledge_base/cubit/knowledge_tree_cubit.dart';
import 'package:smenka_mobile/pages/knowledge_base/cubit/knowledge_tree_state.dart';
import 'package:smenka_mobile/widgets/_widgets.dart';

/// Дерево базы знаний организации (org_member, только чтение).
@RoutePage()
class KnowledgeTreePage extends StatelessWidget {
  const KnowledgeTreePage({@pathParam required this.orgId, super.key});

  final String orgId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => KnowledgeTreeCubit(
        orgId: orgId,
        knowledgeRepository: context.read<KnowledgeRepository>(),
      ),
      child: _KnowledgeTreeView(orgId: orgId),
    );
  }
}

class _KnowledgeTreeView extends StatelessWidget {
  const _KnowledgeTreeView({required this.orgId});

  final String orgId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.knowledgeBaseTitle), centerTitle: true),
      body:
          SectionDataWrapper<
            KnowledgeTreeCubit,
            KnowledgeTreeState,
            List<KnowledgeNode>
          >(
            selector: (state) => state.tree,
            onRetry: () => context.read<KnowledgeTreeCubit>().load(),
            contentBuilder: (nodes) {
              if (nodes.isEmpty) {
                return RefreshIndicator.adaptive(
                  onRefresh: () => context.read<KnowledgeTreeCubit>().load(),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                      AppEmptyState(
                        icon: Icons.menu_book_outlined,
                        title: l10n.knowledgeTreeEmpty,
                      ),
                    ],
                  ),
                );
              }
              return _KnowledgeTreeList(orgId: orgId, nodes: nodes);
            },
          ),
    );
  }
}

class _KnowledgeTreeList extends StatelessWidget {
  const _KnowledgeTreeList({required this.orgId, required this.nodes});

  final String orgId;
  final List<KnowledgeNode> nodes;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<KnowledgeTreeCubit>();

    return BlocSelector<KnowledgeTreeCubit, KnowledgeTreeState, Set<String>>(
      selector: (state) => state.expandedIds,
      builder: (context, expandedIds) {
        final rows = <_TreeRow>[];
        void visit(List<KnowledgeNode> list, int depth) {
          for (final node in list) {
            rows.add((node: node, depth: depth));
            // Раскрываем любой узел с детьми (контракт: и section, и page
            // могут иметь вложенные узлы — бесконечная вложенность).
            if (node.hasChildren && expandedIds.contains(node.id)) {
              visit(node.children, depth + 1);
            }
          }
        }

        visit(nodes, 0);

        return RefreshIndicator.adaptive(
          onRefresh: cubit.load,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: rows.length,
            itemBuilder: (context, index) {
              final row = rows[index];
              return _KnowledgeTreeTile(
                orgId: orgId,
                node: row.node,
                depth: row.depth,
                isExpanded: expandedIds.contains(row.node.id),
              );
            },
          ),
        );
      },
    );
  }
}

typedef _TreeRow = ({KnowledgeNode node, int depth});

class _KnowledgeTreeTile extends StatelessWidget {
  const _KnowledgeTreeTile({
    required this.orgId,
    required this.node,
    required this.depth,
    required this.isExpanded,
  });

  final String orgId;
  final KnowledgeNode node;
  final int depth;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;
    final canOpen = node.isPage; // контент открывают только страницы
    final canExpand = node.hasChildren; // раскрывается любой узел с детьми

    void toggle() => context.read<KnowledgeTreeCubit>().toggleExpanded(node.id);
    void open() => context.router.push(
      KnowledgePageRoute(
        orgId: orgId,
        nodeId: node.id,
        initialTitle: node.title,
      ),
    );

    // Тап по строке: страница → открыть; иначе (section/unknown) → раскрыть.
    final onTap = canOpen
        ? open
        : canExpand
        ? toggle
        : null;

    return Padding(
      padding: EdgeInsets.only(
        left: 8 + depth * 16,
        right: 8,
        top: 3,
        bottom: 3,
      ),
      child: Material(
        color: appColors.surface,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                _NodeLeading(node: node),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    node.title,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: canExpand ? FontWeight.w600 : FontWeight.w500,
                    ),
                  ),
                ),
                // Раскрываемый узел (в т.ч. страница с детьми) — интерактивная
                // стрелка-тоггл; чистая страница — индикатор-шеврон.
                if (canExpand)
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: toggle,
                    icon: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_right,
                      color: appColors.secondary,
                    ),
                  )
                else if (canOpen)
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: appColors.secondary,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NodeLeading extends StatelessWidget {
  const _NodeLeading({required this.node});

  final KnowledgeNode node;

  @override
  Widget build(BuildContext context) {
    final icon = node.icon;
    if (icon != null && icon.isNotEmpty) {
      return Text(icon, style: const TextStyle(fontSize: 20));
    }
    final fallback = switch (node.kind) {
      KnowledgeNodeKind.section => Icons.folder_outlined,
      KnowledgeNodeKind.page => Icons.description_outlined,
      KnowledgeNodeKind.unknown => Icons.article_outlined,
    };
    return Icon(fallback, size: 22, color: context.appColors.primary);
  }
}
