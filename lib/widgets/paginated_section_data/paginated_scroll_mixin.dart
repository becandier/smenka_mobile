import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';

/// Миксин для добавления логики пагинации к виджетам со ScrollController.
///
/// Автоматически вызывает [onLoadMore] когда прокрутка достигает 80% контента.
mixin PaginatedScrollMixin<
  W extends StatefulWidget,
  C extends StateStreamable<S>,
  S,
  T
>
    on State<W> {
  ScrollController get scrollController;
  PaginatedSectionData<T> Function(S state) get selector;
  VoidCallback get onLoadMore;

  bool _isLoadingMore = false;

  void setupPaginationListener() {
    scrollController.addListener(_onScroll);
  }

  void removePaginationListener() {
    scrollController.removeListener(_onScroll);
  }

  void _onScroll() {
    if (_isLoadingMore) return;

    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final threshold = maxScroll * 0.8;

    if (currentScroll >= threshold) {
      final sectionData = selector(context.read<C>().state);
      if (sectionData.hasMore && !sectionData.isLoading) {
        _isLoadingMore = true;
        onLoadMore();
        Future<void>.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _isLoadingMore = false;
          }
        });
      }
    }
  }
}
