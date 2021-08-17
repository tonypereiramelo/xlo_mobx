import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/user.dart';
part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStoreBase with _$UserManagerStore;

abstract class _UserManagerStoreBase with Store {
  @observable
  User? user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedin => user != null;
}
