import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/paginated_section_data/paginated_scroll_mixin.dart';
import 'package:smenka_mobile/widgets/section_data/_section_data.dart';

/// Виджет для отображения пагинированных данных в виде сетки (GridView).
///
/// Автоматически подгружает данные при достижении 80% скролла.
/// Поддерживает pull-to-refresh, состояния загрузки, ошибки и пустого списка.
class PaginatedSectionDataGrid<C extends StateStreamable<S>, S, T>
    extends StatefulWidget {
  const PaginatedSectionDataGrid({
    required this.selector,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.onRefresh,
    required this.gridDelegate,
    this.emptyBuilder,
    this.scrollController,
    this.padding,
    this.physics,
    this.loadingBuilder,
    super.key,
  });

  final PaginatedSectionData<T> Function(S state) selector;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final VoidCallback onLoadMore;
  final VoidCallback onRefresh;
  final SliverGridDelegate gridDelegate;
  final Widget Function()? emptyBuilder;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Widget Function()? loadingBuilder;

  @override
  State<PaginatedSectionDataGrid<C, S, T>> createState() =>
      _PaginatedSectionDataGridState<C, S, T>();
}

class _PaginatedSectionDataGridState<C extends StateStreamable<S>, S, T>
    extends State<PaginatedSectionDataGrid<C, S, T>>
    with PaginatedScrollMixin<PaginatedSectionDataGrid<C, S, T>, C, S, T> {
  late ScrollController _scrollController;

  @override
  ScrollController get scrollController => _scrollController;

  @override
  PaginatedSectionData<T> Function(S state) get selector => widget.selector;

  @override
  VoidCallback get onLoadMore => widget.onLoadMore;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    setupPaginationListener();
  }

  @override
  void dispose() {
    removePaginationListener();
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<C, S, PaginatedSectionData<T>>(
      selector: widget.selector,
      builder: (context, sectionData) {
        // Loading
        if (sectionData.isLoading && sectionData.isEmpty) {
          return widget.loadingBuilder?.call() ?? const SectionLoader();
        }

        // Error
        if (sectionData.hasError && sectionData.isEmpty) {
          return SectionError(
            error: sectionData.error ?? '',
            onRetry: widget.onRefresh,
          );
        }

        // Empty
        if (sectionData.isEmpty && !sectionData.isLoading) {
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              widget.onRefresh();
              await Future<void>.delayed(const Duration(milliseconds: 500));
            },
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  child: widget.emptyBuilder?.call() ??
                      Center(
                        child: Text(
                          context.l10n.noData,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                ),
              ],
            ),
          );
        }

        // Data
        return RefreshIndicator.adaptive(
          onRefresh: () async {
            widget.onRefresh();
            await Future<void>.delayed(const Duration(milliseconds: 500));
          },
          child: CustomScrollView(
            controller: _scrollController,
            physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: widget.padding ?? EdgeInsets.zero,
                sliver: SliverGrid(
                  gridDelegate: widget.gridDelegate,
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => widget.itemBuilder(
                      context,
                      sectionData.data[index],
                      index,
                    ),
                    childCount: sectionData.data.length,
                  ),
                ),
              ),
              if (sectionData.hasMore) const _PaginationLoaderSliver(),
            ],
          ),
        );
      },
    );
  }
}

class _PaginationLoaderSliver extends StatelessWidget {
  const _PaginationLoaderSliver();

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
