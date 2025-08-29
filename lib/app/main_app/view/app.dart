import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:templatecmd/app/_app.dart';
import 'package:templatecmd/app/main_app/cubit/_cubit.dart';
import 'package:templatecmd/build_gen/assets.gen.dart';
import 'package:templatecmd/l10n/app_localizations.dart';
import 'package:templatecmd/pages/_features.dart';
import 'package:templatecmd/pages/debug/cubit/debug_cubit.dart';
import 'package:templatecmd/pages/debug/data/repository/_repository.dart';
import 'package:templatecmd/pages/debug/widgets/debug_gesture_detector.dart';
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
