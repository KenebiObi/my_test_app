import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_test_app/modules/user_details.dart';

const String USER_DEATILS_COLLECTION_REF = "userdetails";

class DataBaseServices {
  final firebase = FirebaseFirestore.instance;

  late final CollectionReference _userdetailsRef;

  DataBaseServices() {
    _userdetailsRef = firebase
        .collection(USER_DEATILS_COLLECTION_REF)
        .withConverter<UserDetails>(
            fromFirestore: (snapshots, _) => UserDetails.fromJson(
                  snapshots.data()!,
                ),
            toFirestore: (userdetail, _) => userdetail.toJson());
  }
  Stream<QuerySnapshot> getUsserDetails() {
    return _userdetailsRef.snapshots();
  }

  // For getting data from firestore
  void addUserDetails(UserDetails userDetail) async {
    _userdetailsRef.add(userDetail);
  }

  void updateUserDetails(String userdetailId, UserDetails userdetail) {
    _userdetailsRef.doc(userdetailId).update(userdetail.toJson());
  }

  void deleteUserDetails(String userdetailId) {
    _userdetailsRef.doc(userdetailId).delete();
  }
}
