import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_test_app/backend/google_auth_services.dart';
import 'package:my_test_app/screens/hidden_drawer_menu_screen.dart';
import 'package:my_test_app/screens/auth_screens/signup_screen.dart';
import 'package:my_test_app/widgets/background_screen_decor.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/auth_state_checker.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/email_textfield.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/password_textfield.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/signup_login_button.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleAuthService authService = GoogleAuthService();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isAuthenticating = false;
  bool _isChanged = false;

  // Dispose the textfield data
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  // Login user, navigate to home page and clear textfield
  Future login() async {
    setState(() {
      _isAuthenticating = true;
    });

    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _firebase.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        print(userCredential);
        print("User created");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HiddenDrawer(),
          ),
        );
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Authentication failed.'),
          ),
        );
      }
    }
    _emailController.clear();
    _passwordController.clear();
    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevent screen from resizing when keyboard appears
      body: BackgroundScreenDecor(
        isNotAuthScreen: false,
        screen: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 50.0,
                left: 50.0,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Lexend",
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 30.0),
                          Visibility(
                            visible: true,
                            child: Text(
                              "Welecom Back",
                              style: TextStyle(
                                fontSize: 30.0,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "You've been missed!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 22.0,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          // Email textfield
                          EmailTextfield(emialController: _emailController),
                          const SizedBox(height: 15.0),
                          // Password textfeild
                          PasswordTextfield(
                            passwordController: _passwordController,
                            isChanged: _isChanged,
                            isConfirmPassword: false,
                          ),
                          const SizedBox(height: 30.0),
                          _isAuthenticating
                              ? CircularProgressIndicator(
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : SignUpLoginButton(
                                  onPressed: login,
                                  isSignUpScreen: false,
                                ),
                          const SizedBox(height: 15.0),
                          AuthStateChecker(
                            screen: SignUpScreen(),
                            isSignInScreen: false,
                          ),
                          const Text(
                            "Or",
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          ElevatedButton.icon(
                            onPressed: () async {
                              // GoogleAuthService().signInWithGoogle();
                              final User? user =
                                  await authService.signInWithGoogle();
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
