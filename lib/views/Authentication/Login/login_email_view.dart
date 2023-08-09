import 'package:flutter/material.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/login_using.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/signup_login_link.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/auth_text_controllers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dhatnoon_v2/constants/routes.dart';

class LoginEmailView extends StatefulWidget {
  const LoginEmailView({super.key});

  @override
  State<LoginEmailView> createState() => _LoginEmailViewState();
}

class _LoginEmailViewState extends State<LoginEmailView> {
  AuthTextControllers authTextControllers = AuthTextControllers();
  TextEditingController p = AuthTextControllers.passwordController;
  TextEditingController e = AuthTextControllers.emailController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    AuthTextControllers.emailController.dispose();
    AuthTextControllers.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 150),
              const Text(
                'Log In',
                style: TextStyle(
                  fontSize: 32,
                  color: ColorConstants.authText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: TextFormField(
                      style: const TextStyle(color: ColorConstants.authText),
                      controller: e,
                      decoration: const InputDecoration(
                          labelText: "EMAIL",
                          labelStyle:
                              TextStyle(color: ColorConstants.authText)),
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(color: ColorConstants.authText),
                    controller: p,
                    decoration: const InputDecoration(
                        labelText: "PASSWORD",
                        labelStyle: TextStyle(color: ColorConstants.authText)),
                  ),
                  const SizedBox(height: 20),
                  buildLoginUsingMobile(context),
                  const SizedBox(height: 111),
                  ElevatedButton(
                    onPressed: () {
                      loginUser(e.text, p.text);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(188, 48),
                      backgroundColor: ColorConstants.authButtonActive,
                      elevation: 6,
                      textStyle: const TextStyle(
                          fontSize: 14, color: ColorConstants.authText),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 16),
                  buildSignUpLink(context),
                  const SizedBox(height: 56),
                  const Text(
                    "Log In or Sign Up",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorConstants.authText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Image.asset(
                      'assets/google-logo.png',
                      width: 45,
                      height: 45,
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

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Login successful
      showToast("login successful!");
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          showToast("No user found with this email!");
        } else if (e.code == 'wrong-password') {
          showToast("Incorrect password!");
        }
      }
    }
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 20);
  }
}
