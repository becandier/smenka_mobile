// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payroll_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PayrollState {

 SectionData<Payroll> get payroll;/// Участники по userId — для перехода на деталь из строки отчёта
/// (MemberDetailRoute требует целый объект Member).
 Map<String, Member> get membersByUserId;/// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
/// По умолчанию — текущий месяц (ТЗ payroll).
 PeriodPreset? get preset;/// Границы произвольного окна (UTC); активны при `preset == null`.
 DateTime? get customFrom; DateTime? get customTo;/// Учитывать штрафы в отчёте (фича fines) → query `include_penalties`.
/// Бэк default `true`; при `false` поля штрафов обнулены, `net = gross`.
 bool get includePenalties;
/// Create a copy of PayrollState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayrollStateCopyWith<PayrollState> get copyWith => _$PayrollStateCopyWithImpl<PayrollState>(this as PayrollState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayrollState&&(identical(other.payroll, payroll) || other.payroll == payroll)&&const DeepCollectionEquality().equals(other.membersByUserId, membersByUserId)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.customFrom, customFrom) || other.customFrom == customFrom)&&(identical(other.customTo, customTo) || other.customTo == customTo)&&(identical(other.includePenalties, includePenalties) || other.includePenalties == includePenalties));
}


@override
int get hashCode => Object.hash(runtimeType,payroll,const DeepCollectionEquality().hash(membersByUserId),preset,customFrom,customTo,includePenalties);

@override
String toString() {
  return 'PayrollState(payroll: $payroll, membersByUserId: $membersByUserId, preset: $preset, customFrom: $customFrom, customTo: $customTo, includePenalties: $includePenalties)';
}


}

/// @nodoc
abstract mixin class $PayrollStateCopyWith<$Res>  {
  factory $PayrollStateCopyWith(PayrollState value, $Res Function(PayrollState) _then) = _$PayrollStateCopyWithImpl;
@useResult
$Res call({
 SectionData<Payroll> payroll, Map<String, Member> membersByUserId, PeriodPreset? preset, DateTime? customFrom, DateTime? customTo, bool includePenalties
});


$SectionDataCopyWith<Payroll, $Res> get payroll;

}
/// @nodoc
class _$PayrollStateCopyWithImpl<$Res>
    implements $PayrollStateCopyWith<$Res> {
  _$PayrollStateCopyWithImpl(this._self, this._then);

  final PayrollState _self;
  final $Res Function(PayrollState) _then;

/// Create a copy of PayrollState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? payroll = null,Object? membersByUserId = null,Object? preset = freezed,Object? customFrom = freezed,Object? customTo = freezed,Object? includePenalties = null,}) {
  return _then(_self.copyWith(
payroll: null == payroll ? _self.payroll : payroll // ignore: cast_nullable_to_non_nullable
as SectionData<Payroll>,membersByUserId: null == membersByUserId ? _self.membersByUserId : membersByUserId // ignore: cast_nullable_to_non_nullable
as Map<String, Member>,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,customFrom: freezed == customFrom ? _self.customFrom : customFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,customTo: freezed == customTo ? _self.customTo : customTo // ignore: cast_nullable_to_non_nullable
as DateTime?,includePenalties: null == includePenalties ? _self.includePenalties : includePenalties // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PayrollState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Payroll, $Res> get payroll {
  
  return $SectionDataCopyWith<Payroll, $Res>(_self.payroll, (value) {
    return _then(_self.copyWith(payroll: value));
  });
}
}


/// Adds pattern-matching-related methods to [PayrollState].
extension PayrollStatePatterns on PayrollState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayrollState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayrollState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayrollState value)  $default,){
final _that = this;
switch (_that) {
case _PayrollState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayrollState value)?  $default,){
final _that = this;
switch (_that) {
case _PayrollState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionData<Payroll> payroll,  Map<String, Member> membersByUserId,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo,  bool includePenalties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayrollState() when $default != null:
return $default(_that.payroll,_that.membersByUserId,_that.preset,_that.customFrom,_that.customTo,_that.includePenalties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionData<Payroll> payroll,  Map<String, Member> membersByUserId,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo,  bool includePenalties)  $default,) {final _that = this;
switch (_that) {
case _PayrollState():
return $default(_that.payroll,_that.membersByUserId,_that.preset,_that.customFrom,_that.customTo,_that.includePenalties);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionData<Payroll> payroll,  Map<String, Member> membersByUserId,  PeriodPreset? preset,  DateTime? customFrom,  DateTime? customTo,  bool includePenalties)?  $default,) {final _that = this;
switch (_that) {
case _PayrollState() when $default != null:
return $default(_that.payroll,_that.membersByUserId,_that.preset,_that.customFrom,_that.customTo,_that.includePenalties);case _:
  return null;

}
}

}

/// @nodoc


class _PayrollState extends PayrollState {
  const _PayrollState({this.payroll = const SectionData<Payroll>(), final  Map<String, Member> membersByUserId = const <String, Member>{}, this.preset = PeriodPreset.month, this.customFrom, this.customTo, this.includePenalties = true}): _membersByUserId = membersByUserId,super._();
  

@override@JsonKey() final  SectionData<Payroll> payroll;
/// Участники по userId — для перехода на деталь из строки отчёта
/// (MemberDetailRoute требует целый объект Member).
 final  Map<String, Member> _membersByUserId;
/// Участники по userId — для перехода на деталь из строки отчёта
/// (MemberDetailRoute требует целый объект Member).
@override@JsonKey() Map<String, Member> get membersByUserId {
  if (_membersByUserId is EqualUnmodifiableMapView) return _membersByUserId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_membersByUserId);
}

/// Пресет окна; null — произвольный диапазон ([customFrom]/[customTo]).
/// По умолчанию — текущий месяц (ТЗ payroll).
@override@JsonKey() final  PeriodPreset? preset;
/// Границы произвольного окна (UTC); активны при `preset == null`.
@override final  DateTime? customFrom;
@override final  DateTime? customTo;
/// Учитывать штрафы в отчёте (фича fines) → query `include_penalties`.
/// Бэк default `true`; при `false` поля штрафов обнулены, `net = gross`.
@override@JsonKey() final  bool includePenalties;

/// Create a copy of PayrollState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayrollStateCopyWith<_PayrollState> get copyWith => __$PayrollStateCopyWithImpl<_PayrollState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayrollState&&(identical(other.payroll, payroll) || other.payroll == payroll)&&const DeepCollectionEquality().equals(other._membersByUserId, _membersByUserId)&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.customFrom, customFrom) || other.customFrom == customFrom)&&(identical(other.customTo, customTo) || other.customTo == customTo)&&(identical(other.includePenalties, includePenalties) || other.includePenalties == includePenalties));
}


@override
int get hashCode => Object.hash(runtimeType,payroll,const DeepCollectionEquality().hash(_membersByUserId),preset,customFrom,customTo,includePenalties);

@override
String toString() {
  return 'PayrollState(payroll: $payroll, membersByUserId: $membersByUserId, preset: $preset, customFrom: $customFrom, customTo: $customTo, includePenalties: $includePenalties)';
}


}

/// @nodoc
abstract mixin class _$PayrollStateCopyWith<$Res> implements $PayrollStateCopyWith<$Res> {
  factory _$PayrollStateCopyWith(_PayrollState value, $Res Function(_PayrollState) _then) = __$PayrollStateCopyWithImpl;
@override @useResult
$Res call({
 SectionData<Payroll> payroll, Map<String, Member> membersByUserId, PeriodPreset? preset, DateTime? customFrom, DateTime? customTo, bool includePenalties
});


@override $SectionDataCopyWith<Payroll, $Res> get payroll;

}
/// @nodoc
class __$PayrollStateCopyWithImpl<$Res>
    implements _$PayrollStateCopyWith<$Res> {
  __$PayrollStateCopyWithImpl(this._self, this._then);

  final _PayrollState _self;
  final $Res Function(_PayrollState) _then;

/// Create a copy of PayrollState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? payroll = null,Object? membersByUserId = null,Object? preset = freezed,Object? customFrom = freezed,Object? customTo = freezed,Object? includePenalties = null,}) {
  return _then(_PayrollState(
payroll: null == payroll ? _self.payroll : payroll // ignore: cast_nullable_to_non_nullable
as SectionData<Payroll>,membersByUserId: null == membersByUserId ? _self._membersByUserId : membersByUserId // ignore: cast_nullable_to_non_nullable
as Map<String, Member>,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as PeriodPreset?,customFrom: freezed == customFrom ? _self.customFrom : customFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,customTo: freezed == customTo ? _self.customTo : customTo // ignore: cast_nullable_to_non_nullable
as DateTime?,includePenalties: null == includePenalties ? _self.includePenalties : includePenalties // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PayrollState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionDataCopyWith<Payroll, $Res> get payroll {
  
  return $SectionDataCopyWith<Payroll, $Res>(_self.payroll, (value) {
    return _then(_self.copyWith(payroll: value));
  });
}
}

// dart format on
