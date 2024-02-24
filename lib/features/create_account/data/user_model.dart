class UserModel {
  String username;
  String email;
  String password;
  UserModel(
      {required this.username, required this.email, required this.password});
  toJson() {
    return {'name': username, 'email': email, 'password': password};
  }
}
