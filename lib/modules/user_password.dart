class UserPassword {
  const UserPassword({
    required this.account,
    required this.password,
  });
  final String account;
  final String password;
}

List<UserPassword> savedPasswords = [];
