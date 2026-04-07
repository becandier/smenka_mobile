part of '../view/organization_detail_page.dart';

class _OrgMembersSection extends StatelessWidget {
  const _OrgMembersSection();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocSelector<OrganizationDetailCubit, OrganizationDetailState,
              SectionData<List<Member>>>(
            selector: (state) => state.members,
            builder: (context, membersSection) {
              final count = membersSection.data?.length ?? 0;
              return Text(
                '${l10n.orgDetailMembers} ($count)',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          BlocSelector<OrganizationDetailCubit, OrganizationDetailState,
              SectionData<List<Member>>>(
            selector: (state) => state.members,
            builder: (context, membersSection) {
              if (membersSection.isLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }

              final members = membersSection.data;
              if (members == null || members.isEmpty) {
                return const SizedBox.shrink();
              }

              return Column(
                children: members.map((m) => _MemberTile(member: m)).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  const _MemberTile({required this.member});

  final Member member;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appColors = context.appColors;
    final textTheme = Theme.of(context).textTheme;

    final roleLabel = switch (member.role) {
      MemberRole.admin => l10n.roleAdmin,
      MemberRole.employee => l10n.roleEmployee,
    };

    final roleColor = switch (member.role) {
      MemberRole.admin => appColors.primary,
      MemberRole.employee => appColors.secondary,
    };

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: appColors.surface,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: appColors.primary.withValues(alpha: 0.08),
                child: Text(
                  member.userName.isNotEmpty
                      ? member.userName[0].toUpperCase()
                      : '?',
                  style: textTheme.labelLarge?.copyWith(
                    color: appColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.userName,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      member.userEmail,
                      style: textTheme.bodySmall?.copyWith(
                        color: appColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: roleColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  child: Text(
                    roleLabel,
                    style: textTheme.labelSmall?.copyWith(
                      color: roleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
