import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:smenka_mobile/app/_app.dart';
import 'package:smenka_mobile/app/main_app/cubit/_cubit.dart';
import 'package:smenka_mobile/core/deep_link/deep_link_service.dart';
import 'package:smenka_mobile/core/deep_link/pending_invite_storage.dart';
import 'package:smenka_mobile/core/network/task.dart';
import 'package:smenka_mobile/app/main_app/widgets/_widgets.dart';
import 'package:smenka_mobile/build_gen/assets.gen.dart';
import 'package:smenka_mobile/core/constants/prefs_keys.dart';
import 'package:smenka_mobile/core/theme/app_theme.dart';
import 'package:smenka_mobile/data/api/local/theme_local_storage_api.dart';
import 'package:smenka_mobile/data/domain/auth/auth_state_notifier.dart';
import 'package:smenka_mobile/data/domain/auth/repositories/auth_repository.dart';
import 'package:smenka_mobile/data/domain/shift/_shift.dart';
import 'package:smenka_mobile/data/domain/organization/_organization.dart';
import 'package:smenka_mobile/data/domain/user/_user.dart';
import 'package:smenka_mobile/data/domain/location/_location.dart';
import 'package:smenka_mobile/shared/auth/cubit/auth_cubit.dart';
import 'package:smenka_mobile/shared/auth/cubit/auth_state.dart';
import 'package:smenka_mobile/l10n/app_localizations.dart';
import 'package:smenka_mobile/l10n/localization_extension.dart';
import 'package:smenka_mobile/pages/debug/cubit/debug_cubit.dart';
import 'package:smenka_mobile/pages/debug/data/repository/_repository.dart';
import 'package:smenka_mobile/pages/debug/widgets/debug_gesture_detector.dart';
import 'package:smenka_mobile/pages/theme/cubit/theme_cubit.dart';
import 'package:upgrader/upgrader.dart';

part 'error_app.dart';
part 'loading_app.dart';
part 'success_app.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainAppCubit(),
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainAppCubit, MainAppState>(
      builder: (context, state) {
        return switch (state) {
          MainAppStateSuccess() => _SuccessApp(
              appConfig: state.appConfig,
              sharedPreferences: state.sharedPreferences,
              packageInfo: state.packageInfo,
              talker: state.talker,
              dio: state.dio,
              debugRepository: state.debugRepository,
              themeMode: state.themeMode,
              authNotifier: state.authNotifier,
              authRepository: state.authRepository,
              shiftRepository: state.shiftRepository,
              organizationRepository: state.organizationRepository,
              userRepository: state.userRepository,
              locationRepository: state.locationRepository,
              deepLinkService: state.deepLinkService,
              pendingInviteStorage: state.pendingInviteStorage,
            ),
          MainAppStateLoading() => const _LoadingApp(),
          MainAppStateError() => _ErrorApp(
              error: state.error,
              stackTrace: state.stackTrace,
            ),
        };
      },
    );
  }
}
