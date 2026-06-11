import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/l10n/error_localization.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/widgets/section_data/_section_data.dart';

/// Sliver-версия пагинированного списка для использования в CustomScrollView.
///
/// Автоматически управляет пагинацией через [ScrollNotification].
class PaginatedSliverList<C extends StateStreamable<S>, S, T>
    extends StatefulWidget {
  const PaginatedSliverList({
    required this.selector,
    required this.itemBuilder,
    required this.onLoadMore,
    this.separatorBuilder,
    this.emptyBuilder,
    this.onRetry,
    this.loadMoreThreshold = 0.8,
    this.loadingBuilder,
    super.key,
  });

  final PaginatedSectionData<T> Function(S state) selector;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final VoidCallback onLoadMore;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Widget Function()? emptyBuilder;
  final VoidCallback? onRetry;
  final double loadMoreThreshold;
  final Widget Function()? loadingBuilder;

  @override
  State<PaginatedSliverList<C, S, T>> createState() =>
      _PaginatedSliverListState<C, S, T>();
}

class _PaginatedSliverListState<C extends StateStreamable<S>, S, T>
    extends State<PaginatedSliverList<C, S, T>> {
  bool _isLoadingMore = false;

  void _onScroll(ScrollNotification notification) {
    if (_isLoadingMore) return;
    if (notification is! ScrollUpdateNotification) return;

    final metrics = notification.metrics;
    final threshold = metrics.maxScrollExtent * widget.loadMoreThreshold;

    if (metrics.pixels >= threshold) {
      final sectionData = widget.selector(context.read<C>().state);
      if (sectionData.hasMore && !sectionData.isLoading) {
        _isLoadingMore = true;
        widget.onLoadMore();
        Future<void>.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _isLoadingMore = false;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _onScroll(notification);
        return false;
      },
      child: BlocSelector<C, S, PaginatedSectionData<T>>(
        selector: widget.selector,
        builder: (context, sectionData) {
          // Loading
          if (sectionData.isLoading && sectionData.isEmpty) {
            return SliverToBoxAdapter(
              child: widget.loadingBuilder?.call() ?? const SectionLoader(),
            );
          }

          // Error
          if (sectionData.hasError && sectionData.isEmpty) {
            return SliverToBoxAdapter(
              child: SectionError(
                error: localizedErrorMessage(
                  context,
                  code: sectionData.errorCode,
                  fallback: sectionData.error,
                ),
                onRetry: widget.onRetry ?? () {},
              ),
            );
          }

          // Empty
          if (sectionData.isEmpty && !sectionData.isLoading) {
            return SliverToBoxAdapter(
              child: widget.emptyBuilder?.call() ??
                  Center(
                    child: Text(
                      context.l10n.noData,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
            );
          }

          // Data
          final itemCount =
              sectionData.data.length + (sectionData.hasMore ? 1 : 0);

          return SliverList.separated(
            separatorBuilder: widget.separatorBuilder ??
                (context, index) => const SizedBox.shrink(),
            itemCount: itemCount,
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
          );
        },
      ),
    );
  }
}

/// Sliver-версия пагинированной сетки для использования в CustomScrollView.
class PaginatedSliverGrid<C extends StateStreamable<S>, S, T>
    extends StatefulWidget {
  const PaginatedSliverGrid({
    required this.selector,
    required this.itemBuilder,
    required this.gridDelegate,
    required this.onLoadMore,
    this.emptyBuilder,
    this.onRetry,
    this.loadMoreThreshold = 0.8,
    this.loadingBuilder,
    super.key,
  });

  final PaginatedSectionData<T> Function(S state) selector;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final SliverGridDelegate gridDelegate;
  final VoidCallback onLoadMore;
  final Widget Function()? emptyBuilder;
  final VoidCallback? onRetry;
  final double loadMoreThreshold;
  final Widget Function()? loadingBuilder;

  @override
  State<PaginatedSliverGrid<C, S, T>> createState() =>
      _PaginatedSliverGridState<C, S, T>();
}

class _PaginatedSliverGridState<C extends StateStreamable<S>, S, T>
    extends State<PaginatedSliverGrid<C, S, T>> {
  bool _isLoadingMore = false;

  void _onScroll(ScrollNotification notification) {
    if (_isLoadingMore) return;
    if (notification is! ScrollUpdateNotification) return;

    final metrics = notification.metrics;
    final threshold = metrics.maxScrollExtent * widget.loadMoreThreshold;

    if (metrics.pixels >= threshold) {
      final sectionData = widget.selector(context.read<C>().state);
      if (sectionData.hasMore && !sectionData.isLoading) {
        _isLoadingMore = true;
        widget.onLoadMore();
        Future<void>.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _isLoadingMore = false;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _onScroll(notification);
        return false;
      },
      child: BlocSelector<C, S, PaginatedSectionData<T>>(
        selector: widget.selector,
        builder: (context, sectionData) {
          // Loading
          if (sectionData.isLoading && sectionData.isEmpty) {
            return SliverToBoxAdapter(
              child: widget.loadingBuilder?.call() ?? const SectionLoader(),
            );
          }

          // Error
          if (sectionData.hasError && sectionData.isEmpty) {
            return SliverToBoxAdapter(
              child: SectionError(
                error: localizedErrorMessage(
                  context,
                  code: sectionData.errorCode,
                  fallback: sectionData.error,
                ),
                onRetry: widget.onRetry ?? () {},
              ),
            );
          }

          // Empty
          if (sectionData.isEmpty && !sectionData.isLoading) {
            return SliverToBoxAdapter(
              child: widget.emptyBuilder?.call() ??
                  Center(
                    child: Text(
                      context.l10n.noData,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
            );
          }

          // Data
          final itemCount =
              sectionData.data.length + (sectionData.hasMore ? 1 : 0);

          return SliverGrid(
            gridDelegate: widget.gridDelegate,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == sectionData.data.length) {
                  return const _PaginationLoader();
                }
                return widget.itemBuilder(
                  context,
                  sectionData.data[index],
                  index,
                );
              },
              childCount: itemCount,
            ),
          );
        },
      ),
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
