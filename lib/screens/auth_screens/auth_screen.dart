import "package:flutter/material.dart";
import 'package:my_test_app/screens/auth_screens/login_screen.dart';
import 'package:my_test_app/screens/auth_screens/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: deviceHeight - 696.8),
            Image.asset("assets/images/epass_img.png"),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60.0),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              child: Text(
                softWrap: true,
                "Sign Up",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  fontFamily: 'Karla',
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60.0),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: const Text(
                softWrap: true,
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  fontFamily: 'Karla',
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            const Stack(
              children: [
                // Positioned(
                //   // bottom: 0,
                //   child: Container(
                //     height: 100.0,
                //     width: 200.0,
                //     decoration: BoxDecoration(
                //       borderRadius: const BorderRadius.only(
                //         topRight: Radius.circular(20.0),
                //         bottomRight: Radius.circular(20.0),
                //       ),
                //       border: Border.all(
                //         width: 1.5,
                //         color: Theme.of(context).colorScheme.primary,
                //       ),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Sign Up",
                //         style: TextStyle(
                //           color: Theme.of(context).colorScheme.primary,
                //           fontWeight: FontWeight.w700,
                //           fontSize: 20.0,
                //           fontFamily: 'Karla',
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   // top: 300,
                //   child: Container(
                //     height: 100.0,
                //     width: 200.0,
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).colorScheme.primary,
                //       borderRadius: const BorderRadius.only(
                //         topRight: Radius.circular(20.0),
                //         bottomRight: Radius.circular(20.0),
                //       ),
                //     ),
                //     child: const Center(
                //       child: Text(
                //         "Login ",
                //         style: TextStyle(
                //           color: Theme.of(context).colorScheme.background,
                //           fontWeight: FontWeight.w700,
                //           fontSize: 20.0,
                //           fontFamily: 'Karla',
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
