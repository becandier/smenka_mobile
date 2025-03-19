// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
    properties..add(DiagnosticsProperty('type', 'MainAppState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MainAppState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainAppState()';
  }
}

/// @nodoc
class $MainAppStateCopyWith<$Res> {
  $MainAppStateCopyWith(MainAppState _, $Res Function(MainAppState) __);
}

/// @nodoc

class MainAppStateSuccess extends MainAppState with DiagnosticableTreeMixin {
  MainAppStateSuccess(
      {required this.appConfig,
      required this.sharedPreferences,
      required this.packageInfo,
      required this.talker,
      required this.dio,
      required this.debugRepository})
      : super._();

  final AppConfig appConfig;
  final SharedPreferences sharedPreferences;
  final PackageInfo packageInfo;
  final Talker talker;
  final Dio dio;
  final IDebugRepositoryImp debugRepository;

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MainAppStateSuccessCopyWith<MainAppStateSuccess> get copyWith =>
      _$MainAppStateSuccessCopyWithImpl<MainAppStateSuccess>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MainAppState.success'))
      ..add(DiagnosticsProperty('appConfig', appConfig))
      ..add(DiagnosticsProperty('sharedPreferences', sharedPreferences))
      ..add(DiagnosticsProperty('packageInfo', packageInfo))
      ..add(DiagnosticsProperty('talker', talker))
      ..add(DiagnosticsProperty('dio', dio))
      ..add(DiagnosticsProperty('debugRepository', debugRepository));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MainAppStateSuccess &&
            (identical(other.appConfig, appConfig) ||
                other.appConfig == appConfig) &&
            (identical(other.sharedPreferences, sharedPreferences) ||
                other.sharedPreferences == sharedPreferences) &&
            (identical(other.packageInfo, packageInfo) ||
                other.packageInfo == packageInfo) &&
            (identical(other.talker, talker) || other.talker == talker) &&
            (identical(other.dio, dio) || other.dio == dio) &&
            (identical(other.debugRepository, debugRepository) ||
                other.debugRepository == debugRepository));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appConfig, sharedPreferences,
      packageInfo, talker, dio, debugRepository);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainAppState.success(appConfig: $appConfig, sharedPreferences: $sharedPreferences, packageInfo: $packageInfo, talker: $talker, dio: $dio, debugRepository: $debugRepository)';
  }
}

/// @nodoc
abstract mixin class $MainAppStateSuccessCopyWith<$Res>
    implements $MainAppStateCopyWith<$Res> {
  factory $MainAppStateSuccessCopyWith(
          MainAppStateSuccess value, $Res Function(MainAppStateSuccess) _then) =
      _$MainAppStateSuccessCopyWithImpl;
  @useResult
  $Res call(
      {AppConfig appConfig,
      SharedPreferences sharedPreferences,
      PackageInfo packageInfo,
      Talker talker,
      Dio dio,
      IDebugRepositoryImp debugRepository});
}

/// @nodoc
class _$MainAppStateSuccessCopyWithImpl<$Res>
    implements $MainAppStateSuccessCopyWith<$Res> {
  _$MainAppStateSuccessCopyWithImpl(this._self, this._then);

  final MainAppStateSuccess _self;
  final $Res Function(MainAppStateSuccess) _then;

  /// Create a copy of MainAppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appConfig = null,
    Object? sharedPreferences = null,
    Object? packageInfo = null,
    Object? talker = null,
    Object? dio = null,
    Object? debugRepository = null,
  }) {
    return _then(MainAppStateSuccess(
      appConfig: null == appConfig
          ? _self.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfig,
      sharedPreferences: null == sharedPreferences
          ? _self.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences,
      packageInfo: null == packageInfo
          ? _self.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo,
      talker: null == talker
          ? _self.talker
          : talker // ignore: cast_nullable_to_non_nullable
              as Talker,
      dio: null == dio
          ? _self.dio
          : dio // ignore: cast_nullable_to_non_nullable
              as Dio,
      debugRepository: null == debugRepository
          ? _self.debugRepository
          : debugRepository // ignore: cast_nullable_to_non_nullable
              as IDebugRepositoryImp,
    ));
  }
}

/// @nodoc

class MainAppStateLoading extends MainAppState with DiagnosticableTreeMixin {
  MainAppStateLoading() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'MainAppState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MainAppStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainAppState.loading()';
  }
}

/// @nodoc

class MainAppStateError extends MainAppState with DiagnosticableTreeMixin {
  MainAppStateError() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'MainAppState.error'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MainAppStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MainAppState.error()';
  }
}

// dart format on
