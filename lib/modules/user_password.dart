import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class UserPassword {
  UserPassword({
    required this.account,
    required this.password,
    required this.userId,
  });
  String account;
  String password;
  String userId;

  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'password': password,
    };
  }
}

final firebaseUserId = FirebaseAuth.instance.currentUser!.uid;

List<UserPassword> savedPasswords = [
  UserPassword(
      account: "GOOGLE", password: "gyvajcgjadjk", userId: firebaseUserId),
];

// void sendData() {
//   FirebaseFirestore.instance
//       .collection('user')
//       .doc(firebaseUserId)
//       .set({'userMail': savedPasswords});
// }

Future<void> saveUserPasswords(
    String userId, List<UserPassword> passwords) async {
  try {
    final CollectionReference userPasswordsRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('passwords');

    for (var password in passwords) {
      await userPasswordsRef.add(password.toJson());
    }

    print('User passwords saved successfully');
  } catch (e) {
    print('Error saving user passwords: $e');
  }
}
