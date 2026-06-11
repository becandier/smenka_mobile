import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smenka_mobile/core/bloc/paginated_section_data.dart';
import 'package:smenka_mobile/core/constants/feature_statuses.dart';
import 'package:smenka_mobile/core/models/default_paginator.dart';
import 'package:smenka_mobile/core/network/task.dart';

/// Mixin для упрощения работы с пагинацией в кубитах.
///
/// Убирает бойлерплейт код для загрузки/подгрузки пагинированных данных.
mixin PaginationMixin<S> on Cubit<S> {
  /// Загружает пагинированные данные с автоматической обработкой состояний.
  ///
  /// [getSection] - получает текущую секцию из стейта
  /// [updateState] - обновляет стейт с новой секцией
  /// [fetch] - функция загрузки данных с сервера
  /// [isRefresh] - true для перезагрузки, false для подгрузки
  /// [onExtraSuccess] - дополнительный callback при успехе
  Future<void> fetchPaginated<T>({
    required PaginatedSectionData<T> Function(S state) getSection,
    required S Function(S state, PaginatedSectionData<T> section) updateState,
    required Future<Task<DefaultPaginator<T>>> Function(int page, int perPage)
    fetch,
    bool isRefresh = true,
    void Function(List<T> newData)? onExtraSuccess,
  }) async {
    final section = getSection(state);

    if (!isRefresh && (!section.hasMore || section.isLoading)) {
      return;
    }

    final page = isRefresh ? 1 : section.currentPage + 1;

    emit(
      updateState(
        state,
        section.copyWith(
          currentPage: isRefresh ? 1 : section.currentPage,
          status: FeatureStatus.loading,
        ),
      ),
    );

    final result = await fetch(page, section.perPage);

    switch (result) {
      case TaskSuccess(:final data):
        final newData = data.data ?? [];
        final resultData = isRefresh ? newData : [...section.data, ...newData];

        emit(
          updateState(
            state,
            PaginatedSectionData<T>(
              data: resultData,
              hasMore: data.hasMore,
              total: data.total,
              currentPage: page,
              perPage: section.perPage,
              status: FeatureStatus.success,
            ),
          ),
        );

        onExtraSuccess?.call(newData);

      case TaskFailure(:final error):
        emit(
          updateState(
            state,
            section.copyWith(
              status: isRefresh ? FeatureStatus.error : section.status,
              error: error.message,
              errorCode: error.code,
            ),
          ),
        );
    }
  }

  /// Упрощённая версия когда API не возвращает hasMore напрямую.
  /// hasMore определяется по количеству: data.length >= perPage.
  Future<void> fetchPaginatedByCount<T>({
    required PaginatedSectionData<T> Function(S state) getSection,
    required S Function(S state, PaginatedSectionData<T> section) updateState,
    required Future<Task<List<T>>> Function(int page, int perPage) fetch,
    bool isRefresh = true,
    void Function(List<T> newData)? onExtraSuccess,
  }) async {
    final section = getSection(state);

    if (!isRefresh && (!section.hasMore || section.isLoading)) {
      return;
    }

    final page = isRefresh ? 1 : section.currentPage + 1;

    emit(
      updateState(
        state,
        section.copyWith(
          currentPage: isRefresh ? 1 : section.currentPage,
          status: FeatureStatus.loading,
        ),
      ),
    );

    final result = await fetch(page, section.perPage);

    switch (result) {
      case TaskSuccess(:final data):
        final resultData = isRefresh ? data : [...section.data, ...data];

        emit(
          updateState(
            state,
            PaginatedSectionData<T>(
              data: resultData,
              hasMore: data.length >= section.perPage,
              currentPage: page,
              perPage: section.perPage,
              status: FeatureStatus.success,
            ),
          ),
        );

        onExtraSuccess?.call(data);

      case TaskFailure(:final error):
        emit(
          updateState(
            state,
            section.copyWith(
              status: isRefresh ? FeatureStatus.error : section.status,
              error: error.message,
              errorCode: error.code,
            ),
          ),
        );
    }
  }
}
