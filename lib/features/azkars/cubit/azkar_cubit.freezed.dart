// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'azkar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AzkarsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AzkarsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AzkarsState()';
  }
}

/// @nodoc
class $AzkarsStateCopyWith<$Res> {
  $AzkarsStateCopyWith(AzkarsState _, $Res Function(AzkarsState) __);
}

/// @nodoc

class Loading implements AzkarsState {
  Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AzkarsState.loading()';
  }
}

/// @nodoc

class Success implements AzkarsState {
  Success({required final List<AzkarE> azkars}) : _azkars = azkars;

  final List<AzkarE> _azkars;
  List<AzkarE> get azkars {
    if (_azkars is EqualUnmodifiableListView) return _azkars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_azkars);
  }

  /// Create a copy of AzkarsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Success &&
            const DeepCollectionEquality().equals(other._azkars, _azkars));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_azkars));

  @override
  String toString() {
    return 'AzkarsState.success(azkars: $azkars)';
  }
}

/// @nodoc
abstract mixin class $SuccessCopyWith<$Res>
    implements $AzkarsStateCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) _then) =
      _$SuccessCopyWithImpl;
  @useResult
  $Res call({List<AzkarE> azkars});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success _self;
  final $Res Function(Success) _then;

  /// Create a copy of AzkarsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? azkars = null,
  }) {
    return _then(Success(
      azkars: null == azkars
          ? _self._azkars
          : azkars // ignore: cast_nullable_to_non_nullable
              as List<AzkarE>,
    ));
  }
}

// dart format on
