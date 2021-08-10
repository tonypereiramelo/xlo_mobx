enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  User({
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  String? name;
  String? email;
  String? phone;
  String? password;
  UserType? userType;
}
