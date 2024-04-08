import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:my_test_app/screens/auth_screens/auth_screen.dart';
import 'package:my_test_app/screens/generate_password_screen.dart';
import 'package:my_test_app/screens/home_page.dart';
import 'package:my_test_app/screens/save_password_screen.dart';

final _firebase = FirebaseAuth.instance;

class HiddenDrawer extends StatefulWidget {
  HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Generate Passwords",
          colorLineSelected: Colors.white,
          baseStyle: const TextStyle(
            fontSize: 20.0,
            fontFamily: "Karla",
            color: Colors.white,
          ),
          selectedStyle: const TextStyle(
            fontSize: 20.0,
            fontFamily: "Karla",
          ),
        ),
        const GeneratePasswordScreen(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: "Save Passwords",
          colorLineSelected: Colors.white,
          baseStyle: const TextStyle(
            fontSize: 20.0,
            fontFamily: "Karla",
            color: Colors.white,
          ),
          selectedStyle: const TextStyle(
            fontSize: 20.0,
            fontFamily: "Karla",
          ),
        ),
        SavePasswordScreen(
          saveDetails: null,
        ),
      ),
    ];
  }

  void logout() {
    if (_firebase.currentUser != null) {
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      elevationAppBar: 0,
      contentCornerRadius: 20.0,
      screens: _pages,
      backgroundColorMenu: Theme.of(context).colorScheme.primary,
      initPositionSelected: 0,
      actionsAppBar: [
        Row(
          children: [
            IconButton(
              onPressed: logout,
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
