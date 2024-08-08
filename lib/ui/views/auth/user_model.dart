class UserModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  // bool get isEmpty {
  //   return name!.isEmpty && email!.isEmpty && age == 0;
  // }

  // bool get isNotEmpty {
  //   return !isEmpty;
  // }
}
