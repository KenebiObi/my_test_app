import 'package:flutter/material.dart';

class AuthStateChecker extends StatelessWidget {
  const AuthStateChecker({
    super.key,
    required this.screen,
    required this.isSignInScreen,
  });
  final Widget screen;
  final bool isSignInScreen;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isSignInScreen ? "Already have an account?" : "Are you new here?",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => screen,
                ),
              );
            },
            child: Text(
              isSignInScreen ? "Login" : "Sign Up",
              style: TextStyle(
                fontSize: 18.0,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
