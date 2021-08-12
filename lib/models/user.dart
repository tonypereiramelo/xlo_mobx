enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.type = UserType.PARTICULAR,
  });

  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  UserType? type;

  @override
  String toString() {
    return User(
      id: id,
      name: name,
      email: email,
      phone: phone,
      type: type,
    ).toString();
  }
}
