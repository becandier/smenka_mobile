import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/paginated_section_data/paginated_scroll_mixin.dart';
import 'package:smenka_mobile/widgets/section_data/_section_data.dart';

/// Виджет для отображения пагинированных данных в виде списка (ListView).
///
/// Автоматически подгружает данные при достижении 80% скролла.
/// Поддерживает pull-to-refresh, состояния загрузки, ошибки и пустого списка.
class PaginatedSectionDataList<C extends StateStreamable<S>, S, T>
    extends StatefulWidget {
  const PaginatedSectionDataList({
    required this.selector,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.onRefresh,
    this.separatorBuilder,
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
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Widget Function()? emptyBuilder;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final Widget Function()? loadingBuilder;

  @override
  State<PaginatedSectionDataList<C, S, T>> createState() =>
      _PaginatedSectionDataListState<C, S, T>();
}

class _PaginatedSectionDataListState<C extends StateStreamable<S>, S, T>
    extends State<PaginatedSectionDataList<C, S, T>>
    with PaginatedScrollMixin<PaginatedSectionDataList<C, S, T>, C, S, T> {
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
          child: ListView.separated(
            controller: _scrollController,
            padding: widget.padding ?? const EdgeInsets.all(16),
            physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
            itemCount: sectionData.data.length + (sectionData.hasMore ? 1 : 0),
            separatorBuilder: (context, index) =>
                widget.separatorBuilder?.call(context, index) ??
                const SizedBox(height: 12),
            itemBuilder: (context, index) {
              if (index == sectionData.data.length) {
                return const _PaginationLoader();
              }
              return widget.itemBuilder(
                context,
                sectionData.data[index],
                index,
              );
            },
          ),
        );
      },
    );
  }
}

class _PaginationLoader extends StatelessWidget {
  const _PaginationLoader();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
