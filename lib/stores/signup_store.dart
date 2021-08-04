import 'package:mobx/mobx.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
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
