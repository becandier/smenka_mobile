// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ChecklistFillPage]
class ChecklistFillRoute extends PageRouteInfo<ChecklistFillRouteArgs> {
  ChecklistFillRoute({
    required String shiftId,
    required String instanceId,
    String? organizationId,
    bool readOnly = false,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ChecklistFillRoute.name,
         args: ChecklistFillRouteArgs(
           shiftId: shiftId,
           instanceId: instanceId,
           organizationId: organizationId,
           readOnly: readOnly,
           key: key,
         ),
         rawPathParams: {'shiftId': shiftId, 'instanceId': instanceId},
         initialChildren: children,
       );

  static const String name = 'ChecklistFillRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ChecklistFillRouteArgs>(
        orElse: () => ChecklistFillRouteArgs(
          shiftId: pathParams.getString('shiftId'),
          instanceId: pathParams.getString('instanceId'),
        ),
      );
      return ChecklistFillPage(
        shiftId: args.shiftId,
        instanceId: args.instanceId,
        organizationId: args.organizationId,
        readOnly: args.readOnly,
        key: args.key,
      );
    },
  );
}

class ChecklistFillRouteArgs {
  const ChecklistFillRouteArgs({
    required this.shiftId,
    required this.instanceId,
    this.organizationId,
    this.readOnly = false,
    this.key,
  });

  final String shiftId;

  final String instanceId;

  final String? organizationId;

  final bool readOnly;

  final Key? key;

  @override
  String toString() {
    return 'ChecklistFillRouteArgs{shiftId: $shiftId, instanceId: $instanceId, organizationId: $organizationId, readOnly: $readOnly, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChecklistFillRouteArgs) return false;
    return shiftId == other.shiftId &&
        instanceId == other.instanceId &&
        organizationId == other.organizationId &&
        readOnly == other.readOnly &&
        key == other.key;
  }

  @override
  int get hashCode =>
      shiftId.hashCode ^
      instanceId.hashCode ^
      organizationId.hashCode ^
      readOnly.hashCode ^
      key.hashCode;
}

/// generated route for
/// [ChecklistPhotoSourcePage]
class ChecklistPhotoSourceRoute extends PageRouteInfo<void> {
  const ChecklistPhotoSourceRoute({List<PageRouteInfo>? children})
    : super(ChecklistPhotoSourceRoute.name, initialChildren: children);

  static const String name = 'ChecklistPhotoSourceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChecklistPhotoSourcePage();
    },
  );
}

/// generated route for
/// [ChecklistPhotoViewerPage]
class ChecklistPhotoViewerRoute
    extends PageRouteInfo<ChecklistPhotoViewerRouteArgs> {
  ChecklistPhotoViewerRoute({
    required List<ChecklistItemPhoto> photos,
    required int initialIndex,
    required bool isAddedSemantics,
    Future<bool> Function(String)? onDeletePhoto,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ChecklistPhotoViewerRoute.name,
         args: ChecklistPhotoViewerRouteArgs(
           photos: photos,
           initialIndex: initialIndex,
           isAddedSemantics: isAddedSemantics,
           onDeletePhoto: onDeletePhoto,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'ChecklistPhotoViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChecklistPhotoViewerRouteArgs>();
      return ChecklistPhotoViewerPage(
        photos: args.photos,
        initialIndex: args.initialIndex,
        isAddedSemantics: args.isAddedSemantics,
        onDeletePhoto: args.onDeletePhoto,
        key: args.key,
      );
    },
  );
}

class ChecklistPhotoViewerRouteArgs {
  const ChecklistPhotoViewerRouteArgs({
    required this.photos,
    required this.initialIndex,
    required this.isAddedSemantics,
    this.onDeletePhoto,
    this.key,
  });

  final List<ChecklistItemPhoto> photos;

  final int initialIndex;

  final bool isAddedSemantics;

  final Future<bool> Function(String)? onDeletePhoto;

  final Key? key;

  @override
  String toString() {
    return 'ChecklistPhotoViewerRouteArgs{photos: $photos, initialIndex: $initialIndex, isAddedSemantics: $isAddedSemantics, onDeletePhoto: $onDeletePhoto, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChecklistPhotoViewerRouteArgs) return false;
    return const ListEquality<ChecklistItemPhoto>().equals(
          photos,
          other.photos,
        ) &&
        initialIndex == other.initialIndex &&
        isAddedSemantics == other.isAddedSemantics &&
        key == other.key;
  }

  @override
  int get hashCode =>
      const ListEquality<ChecklistItemPhoto>().hash(photos) ^
      initialIndex.hashCode ^
      isAddedSemantics.hashCode ^
      key.hashCode;
}

/// generated route for
/// [DateRangePickerPage]
class DateRangePickerRoute extends PageRouteInfo<DateRangePickerRouteArgs> {
  DateRangePickerRoute({
    DateTime? initialFrom,
    DateTime? initialTo,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         DateRangePickerRoute.name,
         args: DateRangePickerRouteArgs(
           initialFrom: initialFrom,
           initialTo: initialTo,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'DateRangePickerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DateRangePickerRouteArgs>(
        orElse: () => const DateRangePickerRouteArgs(),
      );
      return DateRangePickerPage(
        initialFrom: args.initialFrom,
        initialTo: args.initialTo,
        key: args.key,
      );
    },
  );
}

class DateRangePickerRouteArgs {
  const DateRangePickerRouteArgs({this.initialFrom, this.initialTo, this.key});

  final DateTime? initialFrom;

  final DateTime? initialTo;

  final Key? key;

  @override
  String toString() {
    return 'DateRangePickerRouteArgs{initialFrom: $initialFrom, initialTo: $initialTo, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DateRangePickerRouteArgs) return false;
    return initialFrom == other.initialFrom &&
        initialTo == other.initialTo &&
        key == other.key;
  }

  @override
  int get hashCode => initialFrom.hashCode ^ initialTo.hashCode ^ key.hashCode;
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
/// [EmployeePickerPage]
class EmployeePickerRoute extends PageRouteInfo<EmployeePickerRouteArgs> {
  EmployeePickerRoute({
    required String orgId,
    String? selectedUserId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         EmployeePickerRoute.name,
         args: EmployeePickerRouteArgs(
           orgId: orgId,
           selectedUserId: selectedUserId,
           key: key,
         ),
         rawPathParams: {'orgId': orgId},
         initialChildren: children,
       );

  static const String name = 'EmployeePickerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EmployeePickerRouteArgs>(
        orElse: () =>
            EmployeePickerRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return EmployeePickerPage(
        orgId: args.orgId,
        selectedUserId: args.selectedUserId,
        key: args.key,
      );
    },
  );
}

class EmployeePickerRouteArgs {
  const EmployeePickerRouteArgs({
    required this.orgId,
    this.selectedUserId,
    this.key,
  });

  final String orgId;

  final String? selectedUserId;

  final Key? key;

  @override
  String toString() {
    return 'EmployeePickerRouteArgs{orgId: $orgId, selectedUserId: $selectedUserId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EmployeePickerRouteArgs) return false;
    return orgId == other.orgId &&
        selectedUserId == other.selectedUserId &&
        key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ selectedUserId.hashCode ^ key.hashCode;
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
    void Function({required bool didLogin})? onResult,
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

  final void Function({required bool didLogin})? onResult;

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
/// [MemberDetailPage]
class MemberDetailRoute extends PageRouteInfo<MemberDetailRouteArgs> {
  MemberDetailRoute({
    required String orgId,
    required Member member,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         MemberDetailRoute.name,
         args: MemberDetailRouteArgs(orgId: orgId, member: member, key: key),
         initialChildren: children,
       );

  static const String name = 'MemberDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MemberDetailRouteArgs>();
      return MemberDetailPage(
        orgId: args.orgId,
        member: args.member,
        key: args.key,
      );
    },
  );
}

class MemberDetailRouteArgs {
  const MemberDetailRouteArgs({
    required this.orgId,
    required this.member,
    this.key,
  });

  final String orgId;

  final Member member;

  final Key? key;

  @override
  String toString() {
    return 'MemberDetailRouteArgs{orgId: $orgId, member: $member, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MemberDetailRouteArgs) return false;
    return orgId == other.orgId && member == other.member && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ member.hashCode ^ key.hashCode;
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
/// [MyEarningsPage]
class MyEarningsRoute extends PageRouteInfo<MyEarningsRouteArgs> {
  MyEarningsRoute({
    required String orgId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         MyEarningsRoute.name,
         args: MyEarningsRouteArgs(orgId: orgId, key: key),
         rawPathParams: {'orgId': orgId},
         initialChildren: children,
       );

  static const String name = 'MyEarningsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<MyEarningsRouteArgs>(
        orElse: () => MyEarningsRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return MyEarningsPage(orgId: args.orgId, key: args.key);
    },
  );
}

class MyEarningsRouteArgs {
  const MyEarningsRouteArgs({required this.orgId, this.key});

  final String orgId;

  final Key? key;

  @override
  String toString() {
    return 'MyEarningsRouteArgs{orgId: $orgId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MyEarningsRouteArgs) return false;
    return orgId == other.orgId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ key.hashCode;
}

/// generated route for
/// [OrgShiftDetailPage]
class OrgShiftDetailRoute extends PageRouteInfo<OrgShiftDetailRouteArgs> {
  OrgShiftDetailRoute({
    required String orgId,
    required String shiftId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         OrgShiftDetailRoute.name,
         args: OrgShiftDetailRouteArgs(
           orgId: orgId,
           shiftId: shiftId,
           key: key,
         ),
         rawPathParams: {'orgId': orgId, 'shiftId': shiftId},
         initialChildren: children,
       );

  static const String name = 'OrgShiftDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<OrgShiftDetailRouteArgs>(
        orElse: () => OrgShiftDetailRouteArgs(
          orgId: pathParams.getString('orgId'),
          shiftId: pathParams.getString('shiftId'),
        ),
      );
      return OrgShiftDetailPage(
        orgId: args.orgId,
        shiftId: args.shiftId,
        key: args.key,
      );
    },
  );
}

class OrgShiftDetailRouteArgs {
  const OrgShiftDetailRouteArgs({
    required this.orgId,
    required this.shiftId,
    this.key,
  });

  final String orgId;

  final String shiftId;

  final Key? key;

  @override
  String toString() {
    return 'OrgShiftDetailRouteArgs{orgId: $orgId, shiftId: $shiftId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrgShiftDetailRouteArgs) return false;
    return orgId == other.orgId && shiftId == other.shiftId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ shiftId.hashCode ^ key.hashCode;
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
/// [PayrollPage]
class PayrollRoute extends PageRouteInfo<PayrollRouteArgs> {
  PayrollRoute({required String orgId, Key? key, List<PageRouteInfo>? children})
    : super(
        PayrollRoute.name,
        args: PayrollRouteArgs(orgId: orgId, key: key),
        rawPathParams: {'orgId': orgId},
        initialChildren: children,
      );

  static const String name = 'PayrollRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<PayrollRouteArgs>(
        orElse: () => PayrollRouteArgs(orgId: pathParams.getString('orgId')),
      );
      return PayrollPage(orgId: args.orgId, key: args.key);
    },
  );
}

class PayrollRouteArgs {
  const PayrollRouteArgs({required this.orgId, this.key});

  final String orgId;

  final Key? key;

  @override
  String toString() {
    return 'PayrollRouteArgs{orgId: $orgId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PayrollRouteArgs) return false;
    return orgId == other.orgId && key == other.key;
  }

  @override
  int get hashCode => orgId.hashCode ^ key.hashCode;
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
/// [ShiftChecklistsPage]
class ShiftChecklistsRoute extends PageRouteInfo<ShiftChecklistsRouteArgs> {
  ShiftChecklistsRoute({
    required String shiftId,
    String? organizationId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ShiftChecklistsRoute.name,
         args: ShiftChecklistsRouteArgs(
           shiftId: shiftId,
           organizationId: organizationId,
           key: key,
         ),
         rawPathParams: {'shiftId': shiftId},
         initialChildren: children,
       );

  static const String name = 'ShiftChecklistsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ShiftChecklistsRouteArgs>(
        orElse: () =>
            ShiftChecklistsRouteArgs(shiftId: pathParams.getString('shiftId')),
      );
      return ShiftChecklistsPage(
        shiftId: args.shiftId,
        organizationId: args.organizationId,
        key: args.key,
      );
    },
  );
}

class ShiftChecklistsRouteArgs {
  const ShiftChecklistsRouteArgs({
    required this.shiftId,
    this.organizationId,
    this.key,
  });

  final String shiftId;

  final String? organizationId;

  final Key? key;

  @override
  String toString() {
    return 'ShiftChecklistsRouteArgs{shiftId: $shiftId, organizationId: $organizationId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ShiftChecklistsRouteArgs) return false;
    return shiftId == other.shiftId &&
        organizationId == other.organizationId &&
        key == other.key;
  }

  @override
  int get hashCode => shiftId.hashCode ^ organizationId.hashCode ^ key.hashCode;
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

/// generated route for
/// [WorkLocationPickerPage]
class WorkLocationPickerRoute
    extends PageRouteInfo<WorkLocationPickerRouteArgs> {
  WorkLocationPickerRoute({
    required String orgId,
    String? selectedLocationId,
    bool allowNone = false,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         WorkLocationPickerRoute.name,
         args: WorkLocationPickerRouteArgs(
           orgId: orgId,
           selectedLocationId: selectedLocationId,
           allowNone: allowNone,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'WorkLocationPickerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkLocationPickerRouteArgs>();
      return WorkLocationPickerPage(
        orgId: args.orgId,
        selectedLocationId: args.selectedLocationId,
        allowNone: args.allowNone,
        key: args.key,
      );
    },
  );
}

class WorkLocationPickerRouteArgs {
  const WorkLocationPickerRouteArgs({
    required this.orgId,
    this.selectedLocationId,
    this.allowNone = false,
    this.key,
  });

  final String orgId;

  final String? selectedLocationId;

  final bool allowNone;

  final Key? key;

  @override
  String toString() {
    return 'WorkLocationPickerRouteArgs{orgId: $orgId, selectedLocationId: $selectedLocationId, allowNone: $allowNone, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WorkLocationPickerRouteArgs) return false;
    return orgId == other.orgId &&
        selectedLocationId == other.selectedLocationId &&
        allowNone == other.allowNone &&
        key == other.key;
  }

  @override
  int get hashCode =>
      orgId.hashCode ^
      selectedLocationId.hashCode ^
      allowNone.hashCode ^
      key.hashCode;
}
