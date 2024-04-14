// import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleAuthService {
//   signInWithGoogle() async {
//     final _googleSignIn = GoogleSignIn();
//     await _googleSignIn.signOut();
//     final GoogleSignInAccount? gUser = await _googleSignIn.signIn();
//     final GoogleSignInAuthentication gAuth = await gUser!.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: gAuth.accessToken,
//       idToken: gAuth.idToken,
//     );
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  Future<User?> signInWithGoogle() async {
    try {
      final _googleSignIn = GoogleSignIn();
      // await _googleSignIn.signOut();

      final GoogleSignInAccount? gUser = await _googleSignIn.signIn();
      if (gUser == null) {
        // User cancelled sign-in
        return null;
      }
      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return authResult.user;
    } catch (error) {
      print("Error signing in with Google: $error");
      return null;
    }
  }
}
