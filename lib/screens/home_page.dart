import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_test_app/screens/generate_password_screen.dart';
import 'package:my_test_app/screens/auth_screen.dart';
import 'package:my_test_app/screens/save_password_screen.dart';

final _firebase = FirebaseAuth.instance;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  bool onTapBottomNavBarIcon = false;
  int currentIndex = 1;
  List<Widget> screens = [
    const GeneratePasswordScreen(),
    SavePasswordScreen(
      saveDetails: null,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Row(
          children: [
            const SizedBox(width: 15.0),
            CircleAvatar(
              child: Center(
                child: _firebase.currentUser != null
                    ? Text(
                        "${_firebase.currentUser!.email}"[0],
                      )
                    : const Icon(Icons.person_rounded),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(child: screens[currentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60.0,
          vertical: 20.0,
        ),
        child: GNav(
          selectedIndex: currentIndex,
          onTabChange: (int? newIndex) {
            setState(() {
              currentIndex = newIndex!;
              onTapBottomNavBarIcon = !onTapBottomNavBarIcon;
            });
            print(currentIndex);
            print(screens[currentIndex]);
          },
          backgroundColor: Colors.transparent,
          tabBackgroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          activeColor: Colors.white,
          color: Theme.of(context).colorScheme.primary,
          gap: 8.0,
          tabs: [
            GButton(
              icon: onTapBottomNavBarIcon
                  ? Icons.settings_suggest_rounded
                  : Icons.settings_suggest_outlined,
              text: "Generate",
            ),
            GButton(
              icon: onTapBottomNavBarIcon
                  ? Icons.favorite_border_rounded
                  : Icons.favorite_rounded,
              text: "Save",
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.grey[900],
      //     borderRadius: const BorderRadius.only(
      //       topLeft: Radius.circular(20.0),
      //       topRight: Radius.circular(20.0),
      //     ),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 15.0),
      //     child: BottomNavigationBar(
      //       backgroundColor: Colors.grey[900],
      //       type: BottomNavigationBarType.fixed,
      //       items: const [
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.home_outlined,
      //             color: Colors.white,
      //           ),
      //           label: "",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.menu,
      //             color: Colors.white,
      //           ),
      //           label: "",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.contact_phone_outlined,
      //             color: Colors.white,
      //           ),
      //           label: "",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.messenger_outline_outlined,
      //             color: Colors.white,
      //           ),
      //           label: "",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
