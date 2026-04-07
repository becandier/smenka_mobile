// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddEditLocationPage]
class AddEditLocationRoute extends PageRouteInfo<AddEditLocationRouteArgs> {
  AddEditLocationRoute({
    required String orgId,
    WorkLocation? existingLocation,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddEditLocationRoute.name,
          args: AddEditLocationRouteArgs(
            orgId: orgId,
            existingLocation: existingLocation,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddEditLocationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddEditLocationRouteArgs>();
      return AddEditLocationPage(
        orgId: args.orgId,
        existingLocation: args.existingLocation,
        key: args.key,
      );
    },
  );
}

class AddEditLocationRouteArgs {
  const AddEditLocationRouteArgs({
    required this.orgId,
    this.existingLocation,
    this.key,
  });

  final String orgId;

  final WorkLocation? existingLocation;

  final Key? key;

  @override
  String toString() {
    return 'AddEditLocationRouteArgs{orgId: $orgId, existingLocation: $existingLocation, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddEditLocationRouteArgs) return false;
    return orgId == other.orgId &&
        existingLocation == other.existingLocation &&
        key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ existingLocation.hashCode ^ key.hashCode;
}

/// generated route for
/// [CreateOrgModal]
class CreateOrgRoute extends PageRouteInfo<void> {
  const CreateOrgRoute({List<PageRouteInfo>? children})
      : super(CreateOrgRoute.name, initialChildren: children);

  static const String name = 'CreateOrgRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateOrgModal();
    },
  );
}

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
/// [JoinOrgModal]
class JoinOrgRoute extends PageRouteInfo<void> {
  const JoinOrgRoute({List<PageRouteInfo>? children})
      : super(JoinOrgRoute.name, initialChildren: children);

  static const String name = 'JoinOrgRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const JoinOrgModal();
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
/// [MembersPage]
class OrgMembersRoute extends PageRouteInfo<OrgMembersRouteArgs> {
  OrgMembersRoute({
    required String orgId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrgMembersRoute.name,
          args: OrgMembersRouteArgs(orgId: orgId, key: key),
          rawPathParams: {'orgId': orgId},
          initialChildren: children,
        );

  static const String name = 'OrgMembersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<OrgMembersRouteArgs>(
        orElse: () => OrgMembersRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return MembersPage(orgId: args.orgId, key: args.key);
    },
  );
}

class OrgMembersRouteArgs {
  const OrgMembersRouteArgs({required this.orgId, this.key});

  final String orgId;

  final Key? key;

  @override
  String toString() {
    return 'OrgMembersRouteArgs{orgId: $orgId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrgMembersRouteArgs) return false;
    return orgId == other.orgId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ key.hashCode;
}

/// generated route for
/// [OrgSettingsPage]
class OrgSettingsRoute extends PageRouteInfo<OrgSettingsRouteArgs> {
  OrgSettingsRoute({
    required String orgId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrgSettingsRoute.name,
          args: OrgSettingsRouteArgs(orgId: orgId, key: key),
          rawPathParams: {'orgId': orgId},
          initialChildren: children,
        );

  static const String name = 'OrgSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<OrgSettingsRouteArgs>(
        orElse: () =>
            OrgSettingsRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return OrgSettingsPage(orgId: args.orgId, key: args.key);
    },
  );
}

class OrgSettingsRouteArgs {
  const OrgSettingsRouteArgs({required this.orgId, this.key});

  final String orgId;

  final Key? key;

  @override
  String toString() {
    return 'OrgSettingsRouteArgs{orgId: $orgId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrgSettingsRouteArgs) return false;
    return orgId == other.orgId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ key.hashCode;
}

/// generated route for
/// [OrgShiftsPage]
class OrgShiftsRoute extends PageRouteInfo<OrgShiftsRouteArgs> {
  OrgShiftsRoute({
    required String orgId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrgShiftsRoute.name,
          args: OrgShiftsRouteArgs(orgId: orgId, key: key),
          rawPathParams: {'orgId': orgId},
          initialChildren: children,
        );

  static const String name = 'OrgShiftsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<OrgShiftsRouteArgs>(
        orElse: () => OrgShiftsRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return OrgShiftsPage(orgId: args.orgId, key: args.key);
    },
  );
}

class OrgShiftsRouteArgs {
  const OrgShiftsRouteArgs({required this.orgId, this.key});

  final String orgId;

  final Key? key;

  @override
  String toString() {
    return 'OrgShiftsRouteArgs{orgId: $orgId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrgShiftsRouteArgs) return false;
    return orgId == other.orgId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ key.hashCode;
}

/// generated route for
/// [OrgStatsPage]
class OrgStatsRoute extends PageRouteInfo<OrgStatsRouteArgs> {
  OrgStatsRoute({
    required String orgId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrgStatsRoute.name,
          args: OrgStatsRouteArgs(orgId: orgId, key: key),
          rawPathParams: {'orgId': orgId},
          initialChildren: children,
        );

  static const String name = 'OrgStatsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<OrgStatsRouteArgs>(
        orElse: () => OrgStatsRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return OrgStatsPage(orgId: args.orgId, key: args.key);
    },
  );
}

class OrgStatsRouteArgs {
  const OrgStatsRouteArgs({required this.orgId, this.key});

  final String orgId;

  final Key? key;

  @override
  String toString() {
    return 'OrgStatsRouteArgs{orgId: $orgId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrgStatsRouteArgs) return false;
    return orgId == other.orgId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ key.hashCode;
}

/// generated route for
/// [OrganizationDetailPage]
class OrganizationDetailRoute
    extends PageRouteInfo<OrganizationDetailRouteArgs> {
  OrganizationDetailRoute({
    required String orgId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrganizationDetailRoute.name,
          args: OrganizationDetailRouteArgs(orgId: orgId, key: key),
          rawPathParams: {'orgId': orgId},
          initialChildren: children,
        );

  static const String name = 'OrganizationDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<OrganizationDetailRouteArgs>(
        orElse: () =>
            OrganizationDetailRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return OrganizationDetailPage(orgId: args.orgId, key: args.key);
    },
  );
}

class OrganizationDetailRouteArgs {
  const OrganizationDetailRouteArgs({required this.orgId, this.key});

  final String orgId;

  final Key? key;

  @override
  String toString() {
    return 'OrganizationDetailRouteArgs{orgId: $orgId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrganizationDetailRouteArgs) return false;
    return orgId == other.orgId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ key.hashCode;
}

/// generated route for
/// [OrganizationsPage]
class OrganizationsRoute extends PageRouteInfo<void> {
  const OrganizationsRoute({List<PageRouteInfo>? children})
      : super(OrganizationsRoute.name, initialChildren: children);

  static const String name = 'OrganizationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrganizationsPage();
    },
  );
}

/// generated route for
/// [OrganizationsTabPage]
class OrganizationsTab extends PageRouteInfo<void> {
  const OrganizationsTab({List<PageRouteInfo>? children})
      : super(OrganizationsTab.name, initialChildren: children);

  static const String name = 'OrganizationsTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrganizationsTabPage();
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
/// [SuperAdminPage]
class SuperAdminRoute extends PageRouteInfo<void> {
  const SuperAdminRoute({List<PageRouteInfo>? children})
      : super(SuperAdminRoute.name, initialChildren: children);

  static const String name = 'SuperAdminRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SuperAdminPage();
    },
  );
}

/// generated route for
/// [SuperAdminTabPage]
class SuperAdminTab extends PageRouteInfo<void> {
  const SuperAdminTab({List<PageRouteInfo>? children})
      : super(SuperAdminTab.name, initialChildren: children);

  static const String name = 'SuperAdminTab';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SuperAdminTabPage();
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

/// generated route for
/// [WorkLocationsPage]
class WorkLocationsRoute extends PageRouteInfo<WorkLocationsRouteArgs> {
  WorkLocationsRoute({
    required String orgId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          WorkLocationsRoute.name,
          args: WorkLocationsRouteArgs(orgId: orgId, key: key),
          rawPathParams: {'orgId': orgId},
          initialChildren: children,
        );

  static const String name = 'WorkLocationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<WorkLocationsRouteArgs>(
        orElse: () =>
            WorkLocationsRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return WorkLocationsPage(orgId: args.orgId, key: args.key);
    },
  );
}

class WorkLocationsRouteArgs {
  const WorkLocationsRouteArgs({required this.orgId, this.key});

  final String orgId;

  final Key? key;

  @override
  String toString() {
    return 'WorkLocationsRouteArgs{orgId: $orgId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WorkLocationsRouteArgs) return false;
    return orgId == other.orgId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ key.hashCode;
}
