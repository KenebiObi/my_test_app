import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:my_test_app/screens/home_page.dart";
// import 'package:my_test_app/home_page.dart';
import 'package:my_test_app/screens/main_screen.dart';
import "package:my_test_app/screens/signin_screen.dart";
import "package:my_test_app/screens/splash_screen.dart";

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

class PasswordApp extends StatefulWidget {
  const PasswordApp({super.key});

  @override
  State<PasswordApp> createState() => _PasswordAppState();
}

class _PasswordAppState extends State<PasswordApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (userSnapshot.hasData) {
            return const HomePage();
          }
          return MainScreen();
        },
      ),
      theme: appTheme,
    );
  }
}
