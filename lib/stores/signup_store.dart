import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/string_extension.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String? password;
  @action
  void setSenha(String? value) => password = value;
  @computed
  bool get passwordValid =>
      password != null &&
      password!.contains(RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"));
  String? get errorPass1 {
    if (password == null || passwordValid)
      return null;
    else if (password == null || password!.isEmpty)
      return 'Campo Obrigatório';
    else
      return 'Mínimo de oito caracteres, pelo menos uma letra e um número';
  }

  @observable
  String? phone;
  @action
  void setPhone(String? value) => phone = value;
  @computed
  bool get phoneValid =>
      phone != null && phone!.length > 13 && phone!.length < 15;
  String? get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone == null || phone!.isEmpty)
      return 'Campo Obrigatório';
    else
      return 'Telefone tem que conter de 10 a 11 números com ddd';
  }

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
  String? name;
  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length > 6;
  String? get nameError {
    if (name == null || nameValid)
      return null;
    else if (name == null || name!.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Nome muito curto';
  }
}
