import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:my_test_app/screens/home_page.dart";
// import 'package:my_test_app/home_page.dart';
import 'package:my_test_app/screens/auth_screen.dart';
import "package:my_test_app/screens/otp_screen.dart";
import "package:my_test_app/screens/signin_screen.dart";
import "package:my_test_app/screens/splash_screen.dart";

import "firebase_options.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(PasswordApp());
  FlutterNativeSplash.remove();
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
            return const OTPScreen();
          }
          return AuthScreen();
        },
      ),
      theme: appTheme,
    );
  }
}
