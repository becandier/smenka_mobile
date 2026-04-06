// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DebugPage]
class DebugRoute extends PageRouteInfo<void> {
  const DebugRoute({List<PageRouteInfo>? children})
      : super(DebugRoute.name, initialChildren: children);

  static const String name = 'DebugRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DebugPage();
    },
  );
}

/// generated route for
/// [EditProfileModal]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditProfileModal();
    },
  );
}

/// generated route for
/// [ExampleHomePage]
class ExampleHomeRoute extends PageRouteInfo<void> {
  const ExampleHomeRoute({List<PageRouteInfo>? children})
      : super(ExampleHomeRoute.name, initialChildren: children);

  static const String name = 'ExampleHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ExampleHomePage();
    },
  );
}

/// generated route for
/// [HistoryTabPage]
class HistoryTab extends PageRouteInfo<void> {
  const HistoryTab({List<PageRouteInfo>? children})
      : super(HistoryTab.name, initialChildren: children);

  static const String name = 'HistoryTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HistoryTabPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key, onResult: onResult),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return LoginPage(key: args.key, onResult: args.onResult);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onResult});

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [MainRouterPage]
class MainRouterRoute extends PageRouteInfo<void> {
  const MainRouterRoute({List<PageRouteInfo>? children})
      : super(MainRouterRoute.name, initialChildren: children);

  static const String name = 'MainRouterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainRouterPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [ProfileTabPage]
class ProfileTab extends PageRouteInfo<void> {
  const ProfileTab({List<PageRouteInfo>? children})
      : super(ProfileTab.name, initialChildren: children);

  static const String name = 'ProfileTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileTabPage();
    },
  );
}

/// generated route for
/// [ShiftDetailPage]
class ShiftDetailRoute extends PageRouteInfo<ShiftDetailRouteArgs> {
  ShiftDetailRoute({
    required Shift shift,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ShiftDetailRoute.name,
          args: ShiftDetailRouteArgs(shift: shift, key: key),
          initialChildren: children,
        );

  static const String name = 'ShiftDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShiftDetailRouteArgs>();
      return ShiftDetailPage(shift: args.shift, key: args.key);
    },
  );
}

class ShiftDetailRouteArgs {
  const ShiftDetailRouteArgs({required this.shift, this.key});

  final Shift shift;

  final Key? key;

  @override
  String toString() {
    return 'ShiftDetailRouteArgs{shift: $shift, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShiftDetailRouteArgs) return false;
    return shift == other.shift && key == other.key;
  }

  @override
  int get hashCode => shift.hashCode ^ key.hashCode;
}

/// generated route for
/// [ShiftHistoryPage]
class ShiftHistoryRoute extends PageRouteInfo<void> {
  const ShiftHistoryRoute({List<PageRouteInfo>? children})
      : super(ShiftHistoryRoute.name, initialChildren: children);

  static const String name = 'ShiftHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShiftHistoryPage();
    },
  );
}

/// generated route for
/// [ShiftTabPage]
class ShiftTab extends PageRouteInfo<void> {
  const ShiftTab({List<PageRouteInfo>? children})
      : super(ShiftTab.name, initialChildren: children);

  static const String name = 'ShiftTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShiftTabPage();
    },
  );
}

/// generated route for
/// [ShiftTrackerPage]
class ShiftTrackerRoute extends PageRouteInfo<void> {
  const ShiftTrackerRoute({List<PageRouteInfo>? children})
      : super(ShiftTrackerRoute.name, initialChildren: children);

  static const String name = 'ShiftTrackerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShiftTrackerPage();
    },
  );
}

/// generated route for
/// [VerifyPage]
class VerifyRoute extends PageRouteInfo<VerifyRouteArgs> {
  VerifyRoute({required String email, Key? key, List<PageRouteInfo>? children})
      : super(
          VerifyRoute.name,
          args: VerifyRouteArgs(email: email, key: key),
          initialChildren: children,
        );

  static const String name = 'VerifyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerifyRouteArgs>();
      return VerifyPage(email: args.email, key: args.key);
    },
  );
}

class VerifyRouteArgs {
  const VerifyRouteArgs({required this.email, this.key});

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'VerifyRouteArgs{email: $email, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerifyRouteArgs) return false;
    return email == other.email && key == other.key;
  }

  @override
  int get hashCode => email.hashCode ^ key.hashCode;
}
