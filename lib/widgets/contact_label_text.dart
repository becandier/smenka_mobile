import 'package:flutter/widgets.dart';

/// Строка контакта (email или login) под именем — рендерится только если
/// есть что показать; при `contact == null` не занимает места (никакого
/// пустого отступа/«—» посреди вёрстки).
///
/// Общая точка для мест, где раньше безусловно выводился email участника/
/// пользователя (`_ProfileHeader`, `_MemberTile`, member_detail
/// `_HeaderSection`) — см. `docs/tasks/admin_created_accounts`.
class ContactLabelText extends StatelessWidget {
  const ContactLabelText({
    required this.contact,
    required this.style,
    this.spacingBefore = 2,
    super.key,
  });

  final String? contact;
  final TextStyle? style;
  final double spacingBefore;

  @override
  Widget build(BuildContext context) {
    final contact = this.contact;
    if (contact == null) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(top: spacingBefore),
      child: Text(contact, style: style),
    );
  }
}
