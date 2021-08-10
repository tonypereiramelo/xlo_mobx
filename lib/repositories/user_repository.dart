import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

class UserRepository {
  Future<void> signUp(User user) async {
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email,
    );
    parseUser.set<String?>(keyUserName, user.name);
    parseUser.set<String?>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type!.index);

    final response = await parseUser.signUp();

    if (response.success) {
      print(response.result);
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error!.code).toString());
    }
  }
}
