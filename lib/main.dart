import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:my_test_app/screens/home_page.dart";
// import 'package:my_test_app/home_page.dart';
import 'package:my_test_app/screens/main_screen.dart';
import "package:my_test_app/screens/signin_screen.dart";

import "firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(PasswordApp());
}

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(45, 84, 117, 1.000),
  ),
  useMaterial3: true,
);

class PasswordApp extends StatelessWidget {
  const PasswordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return MainScreen();
          }
        },
      ),
      theme: appTheme,
    );
  }
}
