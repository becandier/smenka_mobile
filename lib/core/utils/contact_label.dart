/// Единая логика выбора контакта для отображения: email, а если его нет —
/// login; `null`, если показывать нечего.
///
/// Общий хелпер для `User.contactLabel` и `Member.contactLabel`
/// (`admin_created_accounts`) — учётки, заведённые админом организации, могут
/// быть без email, тогда идентификатор — только логин.
String? resolveContactLabel({required String? email, required String? login}) {
  final trimmedEmail = email?.trim() ?? '';
  if (trimmedEmail.isNotEmpty) return trimmedEmail;
  final trimmedLogin = login?.trim() ?? '';
  return trimmedLogin.isNotEmpty ? trimmedLogin : null;
}
