// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InviteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteState()';
}


}

/// @nodoc
class $InviteStateCopyWith<$Res>  {
$InviteStateCopyWith(InviteState _, $Res Function(InviteState) __);
}


/// Adds pattern-matching-related methods to [InviteState].
extension InviteStatePatterns on InviteState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InviteStateLoading value)?  loading,TResult Function( InviteStateRequiresAuth value)?  requiresAuth,TResult Function( InviteStateSuccess value)?  success,TResult Function( InviteStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InviteStateLoading() when loading != null:
return loading(_that);case InviteStateRequiresAuth() when requiresAuth != null:
return requiresAuth(_that);case InviteStateSuccess() when success != null:
return success(_that);case InviteStateError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InviteStateLoading value)  loading,required TResult Function( InviteStateRequiresAuth value)  requiresAuth,required TResult Function( InviteStateSuccess value)  success,required TResult Function( InviteStateError value)  error,}){
final _that = this;
switch (_that) {
case InviteStateLoading():
return loading(_that);case InviteStateRequiresAuth():
return requiresAuth(_that);case InviteStateSuccess():
return success(_that);case InviteStateError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InviteStateLoading value)?  loading,TResult? Function( InviteStateRequiresAuth value)?  requiresAuth,TResult? Function( InviteStateSuccess value)?  success,TResult? Function( InviteStateError value)?  error,}){
final _that = this;
switch (_that) {
case InviteStateLoading() when loading != null:
return loading(_that);case InviteStateRequiresAuth() when requiresAuth != null:
return requiresAuth(_that);case InviteStateSuccess() when success != null:
return success(_that);case InviteStateError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  requiresAuth,TResult Function( String organizationName)?  success,TResult Function( InviteErrorKind kind,  String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InviteStateLoading() when loading != null:
return loading();case InviteStateRequiresAuth() when requiresAuth != null:
return requiresAuth();case InviteStateSuccess() when success != null:
return success(_that.organizationName);case InviteStateError() when error != null:
return error(_that.kind,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  requiresAuth,required TResult Function( String organizationName)  success,required TResult Function( InviteErrorKind kind,  String? message)  error,}) {final _that = this;
switch (_that) {
case InviteStateLoading():
return loading();case InviteStateRequiresAuth():
return requiresAuth();case InviteStateSuccess():
return success(_that.organizationName);case InviteStateError():
return error(_that.kind,_that.message);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  requiresAuth,TResult? Function( String organizationName)?  success,TResult? Function( InviteErrorKind kind,  String? message)?  error,}) {final _that = this;
switch (_that) {
case InviteStateLoading() when loading != null:
return loading();case InviteStateRequiresAuth() when requiresAuth != null:
return requiresAuth();case InviteStateSuccess() when success != null:
return success(_that.organizationName);case InviteStateError() when error != null:
return error(_that.kind,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class InviteStateLoading implements InviteState {
  const InviteStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteState.loading()';
}


}




/// @nodoc


class InviteStateRequiresAuth implements InviteState {
  const InviteStateRequiresAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteStateRequiresAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteState.requiresAuth()';
}


}




/// @nodoc


class InviteStateSuccess implements InviteState {
  const InviteStateSuccess({required this.organizationName});
  

 final  String organizationName;

/// Create a copy of InviteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteStateSuccessCopyWith<InviteStateSuccess> get copyWith => _$InviteStateSuccessCopyWithImpl<InviteStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteStateSuccess&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName));
}


@override
int get hashCode => Object.hash(runtimeType,organizationName);

@override
String toString() {
  return 'InviteState.success(organizationName: $organizationName)';
}


}

/// @nodoc
abstract mixin class $InviteStateSuccessCopyWith<$Res> implements $InviteStateCopyWith<$Res> {
  factory $InviteStateSuccessCopyWith(InviteStateSuccess value, $Res Function(InviteStateSuccess) _then) = _$InviteStateSuccessCopyWithImpl;
@useResult
$Res call({
 String organizationName
});




}
/// @nodoc
class _$InviteStateSuccessCopyWithImpl<$Res>
    implements $InviteStateSuccessCopyWith<$Res> {
  _$InviteStateSuccessCopyWithImpl(this._self, this._then);

  final InviteStateSuccess _self;
  final $Res Function(InviteStateSuccess) _then;

/// Create a copy of InviteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? organizationName = null,}) {
  return _then(InviteStateSuccess(
organizationName: null == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InviteStateError implements InviteState {
  const InviteStateError({required this.kind, this.message});
  

 final  InviteErrorKind kind;
 final  String? message;

/// Create a copy of InviteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteStateErrorCopyWith<InviteStateError> get copyWith => _$InviteStateErrorCopyWithImpl<InviteStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteStateError&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,kind,message);

@override
String toString() {
  return 'InviteState.error(kind: $kind, message: $message)';
}


}

/// @nodoc
abstract mixin class $InviteStateErrorCopyWith<$Res> implements $InviteStateCopyWith<$Res> {
  factory $InviteStateErrorCopyWith(InviteStateError value, $Res Function(InviteStateError) _then) = _$InviteStateErrorCopyWithImpl;
@useResult
$Res call({
 InviteErrorKind kind, String? message
});




}
/// @nodoc
class _$InviteStateErrorCopyWithImpl<$Res>
    implements $InviteStateErrorCopyWith<$Res> {
  _$InviteStateErrorCopyWithImpl(this._self, this._then);

  final InviteStateError _self;
  final $Res Function(InviteStateError) _then;

/// Create a copy of InviteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? message = freezed,}) {
  return _then(InviteStateError(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as InviteErrorKind,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
