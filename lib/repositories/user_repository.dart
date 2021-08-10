import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

class UserRepository {
  void signUp(User user) {
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email,
    );
    parseUser.set<String?>(keyUserName, user.name);
    parseUser.set<String?>(keyUserPhone, user.phone);
  }
}
