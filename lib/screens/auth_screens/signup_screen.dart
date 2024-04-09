import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_test_app/backend/google_auth_services.dart';
import 'package:my_test_app/screens/auth_screens/login_screen.dart';
import 'package:my_test_app/screens/hidden_drawer_menu_screen.dart';
import 'package:my_test_app/widgets/auth_spiner_dialog.dart';
import 'package:my_test_app/widgets/background_screen_decor.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/auth_state_checker.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/email_textfield.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/google_signin_button.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/password_textfield.dart';
import 'package:my_test_app/widgets/constants/authscreen_widgets/signup_login_button.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GoogleAuthService authService = GoogleAuthService();

  final TextEditingController _EmailTextfield = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isAuthenticating = false;
  bool _isChanged = false;
  bool _doNotMatch = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _EmailTextfield.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  Future signUp() async {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      if (_formKey.currentState!.validate()) {
        setState(
          () {
            _isAuthenticating = true;
            _doNotMatch = false;
            if (_isAuthenticating) {
              showDialog(
                context: context,
                builder: (context) => const AuthSpinerDialog(),
              );
            }
          },
        );

        try {
          UserCredential userCredential =
              await _firebase.createUserWithEmailAndPassword(
            email: _EmailTextfield.text.trim(),
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
          print("NIce");
        } on FirebaseAuthException catch (error) {
          print(error);
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message ?? 'Authentication failed.'),
            ),
          );
        }
        _EmailTextfield.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        setState(() {
          _isAuthenticating = false;
          // Navigator.pop(context);
        });
      }
    } else {
      setState(() {
        _doNotMatch = true;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

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
              const Positioned(
                top: 50.0,
                left: 50.0,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: "Lexend",
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
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
                              "Hello There",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: "Lexend",
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          const Text(
                            "Register to get started",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              letterSpacing: 0.5,
                              fontSize: 22.0,
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          // Email textfield
                          EmailTextfield(emialController: _EmailTextfield),
                          const SizedBox(height: 15.0),
                          // Password textfeild
                          PasswordTextfield(
                            passwordController: _passwordController,
                            isChanged: _isChanged,
                            isConfirmPassword: false,
                          ),
                          const SizedBox(height: 15.0),

                          PasswordTextfield(
                            passwordController: _confirmPasswordController,
                            isChanged: _isChanged,
                            isConfirmPassword: true,
                          ),
                          const SizedBox(height: 30.0),
                          SignUpLoginButton(
                            onPressed: signUp,
                            isSignUpScreen: true,
                          ),

                          _doNotMatch
                              ? const Column(
                                  children: [
                                    SizedBox(height: 15.0),
                                    Text(
                                      "Passwords do  not match",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          const SizedBox(height: 15.0),

                          AuthStateChecker(
                            screen: LoginScreen(),
                            isSignInScreen: true,
                          ),
                          const Text(
                            "Or",
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          GoogleSignInButton(authService: authService),
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
