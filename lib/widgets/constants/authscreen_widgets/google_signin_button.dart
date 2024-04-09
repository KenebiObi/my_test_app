import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:EPASS/backend/google_auth_services.dart';
import 'package:EPASS/screens/hidden_drawer_menu_screen.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    super.key,
    required this.authService,
  });

  final GoogleAuthService authService;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        // GoogleAuthService().signInWithGoogle();
        final User? user = await authService.signInWithGoogle();
        if (user != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HiddenDrawer(),
            ),
          );
        } else {
          // Handle sign-in cancellation or error
          // Show a message or take appropriate action
        }
      },
      icon: Image.asset(
        "assets/images/google.png",
        height: 30.0,
      ),
      label: const Text(
        "Sign In with google",
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
