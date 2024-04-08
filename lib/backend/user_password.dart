import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

List<Map<String, dynamic>> savedUserPasswordDetails = [
  ({
    'account': '3456789876',
    'password': 'zjvaf',
  }),
  ({
    'account': 'sjfac',
    'password': 'zjvaf',
  }),
  ({
    'account': 'sjfjy6567uijhgtac',
    'password': 'zjvaf',
  }),
  ({
    'account': 'sjfac',
    'password': 'zfyvakl7brwiebiawutjvaf',
  }),
  ({
    'account': 'sjfac',
    'password': 'zjvaf',
  }),
  ({
    'account': 'sjfac',
    'password': 'zjvaf',
  }),
];

final db = FirebaseFirestore.instance;
final uuid = Uuid().v1;

// void saveUserDetails(Map<String, dynamic> userDetails) {
//   db
//       .collection("userdetails")
//       .doc(FirebaseAuth.instance.currentUser!.uid)
//       .collection('details')
//       .set(userDetails);
// }

void saveToUser(Map<String, dynamic> userDetails) {
  db
      .collection('userdetails')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('details')
      .add(userDetails)
      .then((value) {
    print("User details added successfully");
  }).catchError((error) {
    print("Failed to add user details: $error");
  });
}
