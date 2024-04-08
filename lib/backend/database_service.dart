import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_test_app/backend/user_details.dart';

const String USER_DEATILS_COLLECTION_REF = "users";

class DataBaseServices {
  final firebase = FirebaseFirestore.instance;

  late final CollectionReference _userdetailsRef;

  final String keyString = 'my32lengthsupersecretnooneknows1';

  DataBaseServices() {
    _userdetailsRef = firebase
        .collection(USER_DEATILS_COLLECTION_REF)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("user_data")
        .withConverter<UserDetails>(
            fromFirestore: (snapshots, _) => UserDetails.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (userdetail, _) => userdetail.toJson());
  }
  Stream<QuerySnapshot> getUsserDetails() {
    return _userdetailsRef.orderBy("createdOn", descending: true).snapshots();
  }

  // String encryptText(String plainText) {
  //   final key = encrypt.Key.fromUtf8(keyString);
  //   final iv = encrypt.IV.fromLength(16);

  //   final encrypter = encrypt.Encrypter(encrypt.AES(key));

  //   final encrypted = encrypter.encrypt(plainText, iv: iv);
  //   return encrypted.base64;
  // }

  // String decryptText(String encryptedText) {
  //   final key = encrypt.Key.fromUtf8(keyString);
  //   final iv = encrypt.IV.fromLength(16);

  //   final encrypter = encrypt.Encrypter(encrypt.AES(key));

  //   final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
  //   return decrypted;
  // }

  void addUserDetails(UserDetails userDetail) async {
    // Encrypt sensitive data before adding to Firestore
    // final encryptedUserDetail = userDetail.copyWith(
    //   // Encrypt any sensitive fields here
    //   password: encryptText(userDetail.password),
    //   // Add more fields if needed
    // );

    // // await _userdetailsRef.add(encryptedUserDetail);
    _userdetailsRef.add(userDetail);
  }

  void updateUserDetails(String userdetailId, UserDetails userdetail) {
    _userdetailsRef.doc(userdetailId).update(userdetail.toJson());
  }

  void deleteUserDetails(String userdetailId) {
    _userdetailsRef.doc(userdetailId).delete();
  }
}
