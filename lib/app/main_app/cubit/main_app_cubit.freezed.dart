// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainAppState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MainAppState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainAppState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MainAppState()';
}


}

/// @nodoc
class $MainAppStateCopyWith<$Res>  {
$MainAppStateCopyWith(MainAppState _, $Res Function(MainAppState) __);
}


/// Adds pattern-matching-related methods to [MainAppState].
extension MainAppStatePatterns on MainAppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MainAppStateSuccess value)?  success,TResult Function( MainAppStateLoading value)?  loading,TResult Function( MainAppStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MainAppStateSuccess() when success != null:
return success(_that);case MainAppStateLoading() when loading != null:
return loading(_that);case MainAppStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MainAppStateSuccess value)  success,required TResult Function( MainAppStateLoading value)  loading,required TResult Function( MainAppStateError value)  error,}){
final _that = this;
switch (_that) {
case MainAppStateSuccess():
return success(_that);case MainAppStateLoading():
return loading(_that);case MainAppStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MainAppStateSuccess value)?  success,TResult? Function( MainAppStateLoading value)?  loading,TResult? Function( MainAppStateError value)?  error,}){
final _that = this;
switch (_that) {
case MainAppStateSuccess() when success != null:
return success(_that);case MainAppStateLoading() when loading != null:
return loading(_that);case MainAppStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppConfig appConfig,  SharedPreferences sharedPreferences,  PackageInfo packageInfo,  Talker talker,  Dio dio,  IDebugRepositoryImp debugRepository,  ThemeMode themeMode,  AuthStateNotifier authNotifier,  AuthRepository authRepository,  ShiftRepository shiftRepository,  OrganizationRepository organizationRepository,  ChecklistRepository checklistRepository,  UserRepository userRepository,  PayrollRepository payrollRepository,  DeepLinkService deepLinkService,  PendingInviteStorage pendingInviteStorage,  ShiftContextStorage shiftContextStorage)?  success,TResult Function()?  loading,TResult Function( Object? error,  StackTrace? stackTrace)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MainAppStateSuccess() when success != null:
return success(_that.appConfig,_that.sharedPreferences,_that.packageInfo,_that.talker,_that.dio,_that.debugRepository,_that.themeMode,_that.authNotifier,_that.authRepository,_that.shiftRepository,_that.organizationRepository,_that.checklistRepository,_that.userRepository,_that.payrollRepository,_that.deepLinkService,_that.pendingInviteStorage,_that.shiftContextStorage);case MainAppStateLoading() when loading != null:
return loading();case MainAppStateError() when error != null:
return error(_that.error,_that.stackTrace);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppConfig appConfig,  SharedPreferences sharedPreferences,  PackageInfo packageInfo,  Talker talker,  Dio dio,  IDebugRepositoryImp debugRepository,  ThemeMode themeMode,  AuthStateNotifier authNotifier,  AuthRepository authRepository,  ShiftRepository shiftRepository,  OrganizationRepository organizationRepository,  ChecklistRepository checklistRepository,  UserRepository userRepository,  PayrollRepository payrollRepository,  DeepLinkService deepLinkService,  PendingInviteStorage pendingInviteStorage,  ShiftContextStorage shiftContextStorage)  success,required TResult Function()  loading,required TResult Function( Object? error,  StackTrace? stackTrace)  error,}) {final _that = this;
switch (_that) {
case MainAppStateSuccess():
return success(_that.appConfig,_that.sharedPreferences,_that.packageInfo,_that.talker,_that.dio,_that.debugRepository,_that.themeMode,_that.authNotifier,_that.authRepository,_that.shiftRepository,_that.organizationRepository,_that.checklistRepository,_that.userRepository,_that.payrollRepository,_that.deepLinkService,_that.pendingInviteStorage,_that.shiftContextStorage);case MainAppStateLoading():
return loading();case MainAppStateError():
return error(_that.error,_that.stackTrace);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppConfig appConfig,  SharedPreferences sharedPreferences,  PackageInfo packageInfo,  Talker talker,  Dio dio,  IDebugRepositoryImp debugRepository,  ThemeMode themeMode,  AuthStateNotifier authNotifier,  AuthRepository authRepository,  ShiftRepository shiftRepository,  OrganizationRepository organizationRepository,  ChecklistRepository checklistRepository,  UserRepository userRepository,  PayrollRepository payrollRepository,  DeepLinkService deepLinkService,  PendingInviteStorage pendingInviteStorage,  ShiftContextStorage shiftContextStorage)?  success,TResult? Function()?  loading,TResult? Function( Object? error,  StackTrace? stackTrace)?  error,}) {final _that = this;
switch (_that) {
case MainAppStateSuccess() when success != null:
return success(_that.appConfig,_that.sharedPreferences,_that.packageInfo,_that.talker,_that.dio,_that.debugRepository,_that.themeMode,_that.authNotifier,_that.authRepository,_that.shiftRepository,_that.organizationRepository,_that.checklistRepository,_that.userRepository,_that.payrollRepository,_that.deepLinkService,_that.pendingInviteStorage,_that.shiftContextStorage);case MainAppStateLoading() when loading != null:
return loading();case MainAppStateError() when error != null:
return error(_that.error,_that.stackTrace);case _:
  return null;

}
}

}

/// @nodoc


class MainAppStateSuccess extends MainAppState with DiagnosticableTreeMixin {
   MainAppStateSuccess({required this.appConfig, required this.sharedPreferences, required this.packageInfo, required this.talker, required this.dio, required this.debugRepository, required this.themeMode, required this.authNotifier, required this.authRepository, required this.shiftRepository, required this.organizationRepository, required this.checklistRepository, required this.userRepository, required this.payrollRepository, required this.deepLinkService, required this.pendingInviteStorage, required this.shiftContextStorage}): super._();
  

 final  AppConfig appConfig;
 final  SharedPreferences sharedPreferences;
 final  PackageInfo packageInfo;
 final  Talker talker;
 final  Dio dio;
 final  IDebugRepositoryImp debugRepository;
 final  ThemeMode themeMode;
 final  AuthStateNotifier authNotifier;
 final  AuthRepository authRepository;
 final  ShiftRepository shiftRepository;
 final  OrganizationRepository organizationRepository;
 final  ChecklistRepository checklistRepository;
 final  UserRepository userRepository;
 final  PayrollRepository payrollRepository;
 final  DeepLinkService deepLinkService;
 final  PendingInviteStorage pendingInviteStorage;
 final  ShiftContextStorage shiftContextStorage;

/// Create a copy of MainAppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainAppStateSuccessCopyWith<MainAppStateSuccess> get copyWith => _$MainAppStateSuccessCopyWithImpl<MainAppStateSuccess>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MainAppState.success'))
    ..add(DiagnosticsProperty('appConfig', appConfig))..add(DiagnosticsProperty('sharedPreferences', sharedPreferences))..add(DiagnosticsProperty('packageInfo', packageInfo))..add(DiagnosticsProperty('talker', talker))..add(DiagnosticsProperty('dio', dio))..add(DiagnosticsProperty('debugRepository', debugRepository))..add(DiagnosticsProperty('themeMode', themeMode))..add(DiagnosticsProperty('authNotifier', authNotifier))..add(DiagnosticsProperty('authRepository', authRepository))..add(DiagnosticsProperty('shiftRepository', shiftRepository))..add(DiagnosticsProperty('organizationRepository', organizationRepository))..add(DiagnosticsProperty('checklistRepository', checklistRepository))..add(DiagnosticsProperty('userRepository', userRepository))..add(DiagnosticsProperty('payrollRepository', payrollRepository))..add(DiagnosticsProperty('deepLinkService', deepLinkService))..add(DiagnosticsProperty('pendingInviteStorage', pendingInviteStorage))..add(DiagnosticsProperty('shiftContextStorage', shiftContextStorage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainAppStateSuccess&&(identical(other.appConfig, appConfig) || other.appConfig == appConfig)&&(identical(other.sharedPreferences, sharedPreferences) || other.sharedPreferences == sharedPreferences)&&(identical(other.packageInfo, packageInfo) || other.packageInfo == packageInfo)&&(identical(other.talker, talker) || other.talker == talker)&&(identical(other.dio, dio) || other.dio == dio)&&(identical(other.debugRepository, debugRepository) || other.debugRepository == debugRepository)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.authNotifier, authNotifier) || other.authNotifier == authNotifier)&&(identical(other.authRepository, authRepository) || other.authRepository == authRepository)&&(identical(other.shiftRepository, shiftRepository) || other.shiftRepository == shiftRepository)&&(identical(other.organizationRepository, organizationRepository) || other.organizationRepository == organizationRepository)&&(identical(other.checklistRepository, checklistRepository) || other.checklistRepository == checklistRepository)&&(identical(other.userRepository, userRepository) || other.userRepository == userRepository)&&(identical(other.payrollRepository, payrollRepository) || other.payrollRepository == payrollRepository)&&(identical(other.deepLinkService, deepLinkService) || other.deepLinkService == deepLinkService)&&(identical(other.pendingInviteStorage, pendingInviteStorage) || other.pendingInviteStorage == pendingInviteStorage)&&(identical(other.shiftContextStorage, shiftContextStorage) || other.shiftContextStorage == shiftContextStorage));
}


@override
int get hashCode => Object.hash(runtimeType,appConfig,sharedPreferences,packageInfo,talker,dio,debugRepository,themeMode,authNotifier,authRepository,shiftRepository,organizationRepository,checklistRepository,userRepository,payrollRepository,deepLinkService,pendingInviteStorage,shiftContextStorage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MainAppState.success(appConfig: $appConfig, sharedPreferences: $sharedPreferences, packageInfo: $packageInfo, talker: $talker, dio: $dio, debugRepository: $debugRepository, themeMode: $themeMode, authNotifier: $authNotifier, authRepository: $authRepository, shiftRepository: $shiftRepository, organizationRepository: $organizationRepository, checklistRepository: $checklistRepository, userRepository: $userRepository, payrollRepository: $payrollRepository, deepLinkService: $deepLinkService, pendingInviteStorage: $pendingInviteStorage, shiftContextStorage: $shiftContextStorage)';
}


}

/// @nodoc
abstract mixin class $MainAppStateSuccessCopyWith<$Res> implements $MainAppStateCopyWith<$Res> {
  factory $MainAppStateSuccessCopyWith(MainAppStateSuccess value, $Res Function(MainAppStateSuccess) _then) = _$MainAppStateSuccessCopyWithImpl;
@useResult
$Res call({
 AppConfig appConfig, SharedPreferences sharedPreferences, PackageInfo packageInfo, Talker talker, Dio dio, IDebugRepositoryImp debugRepository, ThemeMode themeMode, AuthStateNotifier authNotifier, AuthRepository authRepository, ShiftRepository shiftRepository, OrganizationRepository organizationRepository, ChecklistRepository checklistRepository, UserRepository userRepository, PayrollRepository payrollRepository, DeepLinkService deepLinkService, PendingInviteStorage pendingInviteStorage, ShiftContextStorage shiftContextStorage
});




}
/// @nodoc
class _$MainAppStateSuccessCopyWithImpl<$Res>
    implements $MainAppStateSuccessCopyWith<$Res> {
  _$MainAppStateSuccessCopyWithImpl(this._self, this._then);

  final MainAppStateSuccess _self;
  final $Res Function(MainAppStateSuccess) _then;

/// Create a copy of MainAppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? appConfig = null,Object? sharedPreferences = null,Object? packageInfo = null,Object? talker = null,Object? dio = null,Object? debugRepository = null,Object? themeMode = null,Object? authNotifier = null,Object? authRepository = null,Object? shiftRepository = null,Object? organizationRepository = null,Object? checklistRepository = null,Object? userRepository = null,Object? payrollRepository = null,Object? deepLinkService = null,Object? pendingInviteStorage = null,Object? shiftContextStorage = null,}) {
  return _then(MainAppStateSuccess(
appConfig: null == appConfig ? _self.appConfig : appConfig // ignore: cast_nullable_to_non_nullable
as AppConfig,sharedPreferences: null == sharedPreferences ? _self.sharedPreferences : sharedPreferences // ignore: cast_nullable_to_non_nullable
as SharedPreferences,packageInfo: null == packageInfo ? _self.packageInfo : packageInfo // ignore: cast_nullable_to_non_nullable
as PackageInfo,talker: null == talker ? _self.talker : talker // ignore: cast_nullable_to_non_nullable
as Talker,dio: null == dio ? _self.dio : dio // ignore: cast_nullable_to_non_nullable
as Dio,debugRepository: null == debugRepository ? _self.debugRepository : debugRepository // ignore: cast_nullable_to_non_nullable
as IDebugRepositoryImp,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,authNotifier: null == authNotifier ? _self.authNotifier : authNotifier // ignore: cast_nullable_to_non_nullable
as AuthStateNotifier,authRepository: null == authRepository ? _self.authRepository : authRepository // ignore: cast_nullable_to_non_nullable
as AuthRepository,shiftRepository: null == shiftRepository ? _self.shiftRepository : shiftRepository // ignore: cast_nullable_to_non_nullable
as ShiftRepository,organizationRepository: null == organizationRepository ? _self.organizationRepository : organizationRepository // ignore: cast_nullable_to_non_nullable
as OrganizationRepository,checklistRepository: null == checklistRepository ? _self.checklistRepository : checklistRepository // ignore: cast_nullable_to_non_nullable
as ChecklistRepository,userRepository: null == userRepository ? _self.userRepository : userRepository // ignore: cast_nullable_to_non_nullable
as UserRepository,payrollRepository: null == payrollRepository ? _self.payrollRepository : payrollRepository // ignore: cast_nullable_to_non_nullable
as PayrollRepository,deepLinkService: null == deepLinkService ? _self.deepLinkService : deepLinkService // ignore: cast_nullable_to_non_nullable
as DeepLinkService,pendingInviteStorage: null == pendingInviteStorage ? _self.pendingInviteStorage : pendingInviteStorage // ignore: cast_nullable_to_non_nullable
as PendingInviteStorage,shiftContextStorage: null == shiftContextStorage ? _self.shiftContextStorage : shiftContextStorage // ignore: cast_nullable_to_non_nullable
as ShiftContextStorage,
  ));
}


}

/// @nodoc


class MainAppStateLoading extends MainAppState with DiagnosticableTreeMixin {
   MainAppStateLoading(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MainAppState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainAppStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MainAppState.loading()';
}


}




/// @nodoc


class MainAppStateError extends MainAppState with DiagnosticableTreeMixin {
   MainAppStateError({required this.error, required this.stackTrace}): super._();
  

 final  Object? error;
 final  StackTrace? stackTrace;

/// Create a copy of MainAppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainAppStateErrorCopyWith<MainAppStateError> get copyWith => _$MainAppStateErrorCopyWithImpl<MainAppStateError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MainAppState.error'))
    ..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('stackTrace', stackTrace));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainAppStateError&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.stackTrace, stackTrace) || other.stackTrace == stackTrace));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),stackTrace);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MainAppState.error(error: $error, stackTrace: $stackTrace)';
}


}

/// @nodoc
abstract mixin class $MainAppStateErrorCopyWith<$Res> implements $MainAppStateCopyWith<$Res> {
  factory $MainAppStateErrorCopyWith(MainAppStateError value, $Res Function(MainAppStateError) _then) = _$MainAppStateErrorCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? stackTrace
});




}
/// @nodoc
class _$MainAppStateErrorCopyWithImpl<$Res>
    implements $MainAppStateErrorCopyWith<$Res> {
  _$MainAppStateErrorCopyWithImpl(this._self, this._then);

  final MainAppStateError _self;
  final $Res Function(MainAppStateError) _then;

/// Create a copy of MainAppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? stackTrace = freezed,}) {
  return _then(MainAppStateError(
error: freezed == error ? _self.error : error ,stackTrace: freezed == stackTrace ? _self.stackTrace : stackTrace // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
