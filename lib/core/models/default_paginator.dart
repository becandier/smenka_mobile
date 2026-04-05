import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_paginator.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class DefaultPaginator<T> with _$DefaultPaginator<T> {
  factory DefaultPaginator({
    required bool hasMore,
    required List<T>? data,
    int? total,
  }) = _DefaultPaginator;
}
