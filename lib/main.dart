import "package:animated_splash_screen/animated_splash_screen.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart";
import "package:flutter/material.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:my_test_app/screens/home_page.dart";
// import 'package:my_test_app/home_page.dart';
import 'package:my_test_app/screens/auth_screens/auth_screen.dart';
import 'package:my_test_app/extras/otp_screen.dart';
import 'package:my_test_app/screens/auth_screens/signup_screen.dart';
import "package:my_test_app/screens/splash_screen.dart";
import 'package:my_test_app/screens/hidden_drawer_menu_screen.dart';

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
    seedColor: const Color.fromRGBO(42, 82, 117, 1.000),
  ),
  fontFamily: "Karla",
  useMaterial3: true,
);
final darkAppTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(45, 84, 117, 1.000),
  ),
  fontFamily: "Karla",
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
    return FirebasePhoneAuthProvider(
      child: MaterialApp(
        // theme: ThemeData().copyWith(
        //   useMaterial3: true,
        //   colorScheme: appTheme.colorScheme,
        //   appBarTheme: const AppBarTheme().copyWith(
        //     backgroundColor: appTheme.colorScheme.onPrimaryContainer,
        //     foregroundColor: appTheme.colorScheme.primaryContainer,
        //     // centerTitle: true
        //   ),
        //   cardTheme: const CardTheme().copyWith(
        //     color: appTheme.colorScheme.primaryContainer,
        //     margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        //   ),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: appTheme.colorScheme.secondaryContainer,
        //     ),
        //   ),
        //   textTheme: ThemeData().textTheme.copyWith(
        //         titleLarge: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           color: appTheme.colorScheme.onPrimaryContainer,
        //         ),
        //       ),
        //   iconTheme: ThemeData().iconTheme.copyWith(
        //         color: appTheme.colorScheme.onPrimaryContainer,
        //       ),
        //   snackBarTheme: ThemeData().snackBarTheme.copyWith(
        //         backgroundColor: appTheme.colorScheme.onPrimaryContainer,
        //       ),
        // ),
        // darkTheme: ThemeData.dark().copyWith(
        //   useMaterial3: true,
        //   colorScheme: darkAppTheme.colorScheme,
        //   cardTheme: const CardTheme().copyWith(
        //     color: darkAppTheme.colorScheme.secondaryContainer,
        //     margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
        //   ),
        //   elevatedButtonTheme: ElevatedButtonThemeData(
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: darkAppTheme.colorScheme.secondaryContainer,
        //       foregroundColor: darkAppTheme.colorScheme.onPrimaryContainer,
        //     ),
        //   ),
        //   snackBarTheme: ThemeData().snackBarTheme.copyWith(
        //         backgroundColor: darkAppTheme.colorScheme.onSecondaryContainer,
        //       ),
        // ),
        theme: appTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (userSnapshot.hasData) {
              return HiddenDrawer();
            }
            return const AuthScreen();
          },
        ),
      ),
    );
  }
}
