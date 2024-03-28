import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  String account;
  String password;

  UserDetails({
    required this.account,
    required this.password,
  });

  UserDetails.fromJson(Map<String, Object?> json)
      : this(
          account: json["account"]! as String,
          password: json["password"]! as String,
        );

  UserDetails copyWith({
    String? account,
    String? password,
  }) {
    return UserDetails(
      account: account ?? this.account,
      password: password ?? this.password,
    );
  }

  Map<String, Object> toJson() {
    return {
      "account": account,
      "password": password,
    };
  }
}
