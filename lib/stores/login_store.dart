import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/string_extension.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String? email;
  @action
  void setEmail(String? value) => email = value;
  @computed
  bool get emailValid => email != null && email!.isEmailValid();
  String? get emailError {
    if (email == null || emailValid)
      return null;
    else if (email == null || email!.isEmpty)
      return 'Campo Obrigatório!';
    else
      return 'Insira um e-mail válido';
  }

  @observable
  String? password;
  @action
  void setpassword(String? value) => password = value;
  @computed
  bool get passwordValid =>
      password != null &&
      password!.contains(RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"));
  String? get errorpassword {
    if (password == null || passwordValid)
      return null;
    else if (password == null || password!.isEmpty)
      return 'Campo Obrigatório';
    else
      return 'Mínimo de oito caracteres, pelo menos uma letra e um número';
  }

  @computed
  VoidCallback? get loginPressed =>
      emailValid && passwordValid && !loadding ? _login : null;

  @observable
  bool loadding = false;
  @action
  Future<void> _login() async {
    loadding = true;

    await Future.delayed(Duration(seconds: 3));

    loadding = false;
  }
}
