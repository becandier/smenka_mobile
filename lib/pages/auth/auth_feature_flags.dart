/// Компайл-тайм флаги фичи auth.
///
/// Видимость OAuth-входа (Google/Apple) на экране логина. При `false` секция
/// OAuth (разделитель + кнопки) не рендерится вообще. Вся логика входа через
/// OAuth (`LoginCubit.signInWithGoogle/Apple`, репозитории, DataSources, DTO,
/// пакеты `google_sign_in` / `sign_in_with_apple`) остаётся нетронутой —
/// включается обратно сменой одной строки на `true`.
const bool kOAuthLoginEnabled = false;
