import 'package:freezed_annotation/freezed_annotation.dart';

part 'join_result.freezed.dart';

@freezed
abstract class JoinResult with _$JoinResult {
  const factory JoinResult({
    required String organizationId,
    required String organizationName,
    required String role,
  }) = _JoinResult;
}
