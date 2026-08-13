import 'package:flutter_test/flutter_test.dart';
import 'package:smenka_mobile/pages/auth/cubit/login_state.dart';

void main() {
  group('LoginState.isFormValid — вход по логину или email', () {
    test('логин (не email по формату) + пароль → форма валидна', () {
      const state = LoginState(identifier: 'ivanov', password: 'p4ssword');

      expect(state.isEmailValid, isFalse);
      expect(state.isIdentifierProvided, isTrue);
      expect(state.isFormValid, isTrue);
    });

    test('email по формату + пароль → форма валидна (как раньше)', () {
      const state = LoginState(
        identifier: 'ivan@mail.com',
        password: 'p4ssword',
      );

      expect(state.isFormValid, isTrue);
    });

    test('пустой идентификатор → форма невалидна', () {
      const state = LoginState(identifier: '   ', password: 'p4ssword');

      expect(state.isIdentifierProvided, isFalse);
      expect(state.isFormValid, isFalse);
    });

    test('пустой пароль → форма невалидна, даже если логин указан', () {
      const state = LoginState(identifier: 'ivanov');

      expect(state.isFormValid, isFalse);
    });
  });

  group('LoginState.isFormValid — регистрация (не меняется)', () {
    test('идентификатор не в формате email → форма невалидна', () {
      const state = LoginState(
        mode: AuthMode.register,
        identifier: 'ivanov',
        password: 'p4ssword1',
        name: 'Иван',
      );

      expect(state.isFormValid, isFalse);
    });

    test('валидный email + пароль + имя → форма валидна', () {
      const state = LoginState(
        mode: AuthMode.register,
        identifier: 'ivan@mail.com',
        password: 'p4ssword1',
        name: 'Иван',
      );

      expect(state.isFormValid, isTrue);
    });
  });
}
