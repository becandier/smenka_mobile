part of '../view/shift_tracker_page.dart';

class _OrgSelector extends StatelessWidget {
  const _OrgSelector({
    required this.organizations,
    required this.selectedOrganizationId,
    required this.onChanged,
  });

  final List<Organization> organizations;
  final String? selectedOrganizationId;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.shiftSelectOrg,
          style: textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String?>(
          // initialValue применяется один раз при создании state формы:
          // ValueKey пересоздаёт поле при внешней смене выбора
          // (асинхронный предвыбор, сохранение контекста после finishShift)
          key: ValueKey<String?>(selectedOrganizationId),
          initialValue: selectedOrganizationId,
          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          items: [
            DropdownMenuItem<String?>(
              child: Text(l10n.shiftPersonal),
            ),
            ...organizations.map(
              (org) => DropdownMenuItem<String?>(
                value: org.id,
                child: Text(org.name),
              ),
            ),
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
