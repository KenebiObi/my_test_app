class UserPassword {
  UserPassword({
    required this.account,
    required this.password,
  });
  String account;
  String password;
}

List<UserPassword> savedPasswords = [];
