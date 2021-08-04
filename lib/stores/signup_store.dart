import 'package:mobx/mobx.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String? email;
  @action
  void setEmail(String? value) => email = value;
  @computed
  bool get emailValid =>
      email != null && email!.contains("@") && email!.contains('.com');
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
