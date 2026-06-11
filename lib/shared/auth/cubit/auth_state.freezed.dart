// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthCubitState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCubitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthCubitState()';
}


}

/// @nodoc
class $AuthCubitStateCopyWith<$Res>  {
$AuthCubitStateCopyWith(AuthCubitState _, $Res Function(AuthCubitState) __);
}


/// Adds pattern-matching-related methods to [AuthCubitState].
extension AuthCubitStatePatterns on AuthCubitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthCubitAuthenticated value)?  authenticated,TResult Function( AuthCubitUnauthenticated value)?  unauthenticated,TResult Function( AuthCubitUnknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthCubitAuthenticated() when authenticated != null:
return authenticated(_that);case AuthCubitUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthCubitUnknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthCubitAuthenticated value)  authenticated,required TResult Function( AuthCubitUnauthenticated value)  unauthenticated,required TResult Function( AuthCubitUnknown value)  unknown,}){
final _that = this;
switch (_that) {
case AuthCubitAuthenticated():
return authenticated(_that);case AuthCubitUnauthenticated():
return unauthenticated(_that);case AuthCubitUnknown():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthCubitAuthenticated value)?  authenticated,TResult? Function( AuthCubitUnauthenticated value)?  unauthenticated,TResult? Function( AuthCubitUnknown value)?  unknown,}){
final _that = this;
switch (_that) {
case AuthCubitAuthenticated() when authenticated != null:
return authenticated(_that);case AuthCubitUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthCubitUnknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authenticated,TResult Function()?  unauthenticated,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthCubitAuthenticated() when authenticated != null:
return authenticated();case AuthCubitUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthCubitUnknown() when unknown != null:
return unknown();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authenticated,required TResult Function()  unauthenticated,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case AuthCubitAuthenticated():
return authenticated();case AuthCubitUnauthenticated():
return unauthenticated();case AuthCubitUnknown():
return unknown();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authenticated,TResult? Function()?  unauthenticated,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case AuthCubitAuthenticated() when authenticated != null:
return authenticated();case AuthCubitUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthCubitUnknown() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class AuthCubitAuthenticated implements AuthCubitState {
  const AuthCubitAuthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCubitAuthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthCubitState.authenticated()';
}


}




/// @nodoc


class AuthCubitUnauthenticated implements AuthCubitState {
  const AuthCubitUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCubitUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthCubitState.unauthenticated()';
}


}




/// @nodoc


class AuthCubitUnknown implements AuthCubitState {
  const AuthCubitUnknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCubitUnknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthCubitState.unknown()';
}


}




// dart format on
