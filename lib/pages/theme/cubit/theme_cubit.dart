import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:templatecmd/data/api/local/theme_local_storage_api.dart';

/// Cubit for managing application theme mode.
///
/// Handles theme switching between light, dark, and system modes.
/// Persists user preference to local storage automatically.
///
/// Usage:
/// ```dart
/// BlocProvider(
///   create: (_) => ThemeCubit(
///     themeLocalStorageApi: api,
///     initialValue: ThemeMode.system,
///   ),
///   child: MaterialApp(...),
/// )
/// ```
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({
    required ThemeLocalStorageApi themeLocalStorageApi,
    required ThemeMode initialValue,
  })  : _themeLocalStorageApi = themeLocalStorageApi,
        super(initialValue);

  final ThemeLocalStorageApi _themeLocalStorageApi;

  /// Switches theme mode and persists to storage.
  ///
  /// [themeMode] - New theme mode (defaults to system if null)
  Future<void> toggleTheme(ThemeMode? themeMode) async {
    emit(themeMode ?? ThemeMode.system);
    await _themeLocalStorageApi.write(themeMode?.name ?? ThemeMode.system.name);
  }
}
