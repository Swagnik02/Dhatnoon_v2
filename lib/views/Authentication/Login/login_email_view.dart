import 'package:dhatnoon_v2/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/login_using.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/auth_text_controllers.dart';
import '../../../widgets.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import '../SignUp/google_signup.dart';
import '../auth_components/CustomTemplates/auth_text_fields.dart';
import '../auth_components/CustomTemplates/auth_btn_ui.dart';

class LoginEmailView extends StatefulWidget {
  const LoginEmailView({super.key});

  @override
  State<LoginEmailView> createState() => _LoginEmailViewState();
}

class _LoginEmailViewState extends State<LoginEmailView> {
  AuthTextControllers authTextControllers = AuthTextControllers();
  late TextEditingController p = authTextControllers.passwordController;
  late TextEditingController e = authTextControllers.emailController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 150),
              const Text(
                'Log In',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 32,
                  color: ColorConstants.authText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "EMAIL",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  AuthTextField(controller: e),
                  const SizedBox(height: 32),
                  const Text(
                    "PASSWORD",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  AuthTextField(controller: p),
                ],
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () => resetPassword(e.text),
                child: const Text(
                  "Forgot Your Password?",
                  style:
                  TextStyle(color: ColorConstants.authText, fontSize: 18),
                ),
              ),
              buildLoginUsingMobile(context),
              const SizedBox(height: 111),
              AuthBtnUI(
                text: 'Log In',
                onPressed: () {
                  loginUser(e.text, p.text);
                },
              ),
              GestureDetector(
                onTap: () async{
                  await AuthService().signInWithGoogle();
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>const UserRequest()));
                },

                //   onTap: ()=>AuthService().signInWithGoogle(){
                //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
                // },
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Image.asset(
                    'assets/google-logo.png',
                    width: 45,
                    height: 45,
                  ),
                ),
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
      // Sign in (or link) the user with the credential
      Navigator.pushNamedAndRemoveUntil(
        context,
        homeRoute,
            (route) => false,
      );
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

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showToast("Password Reset Email sent!");
    } catch (e) {
      // Handle password reset errors
    }
  }

  @override
  void dispose() {
    p.dispose(); // Dispose the password controller
    e.dispose(); // Dispose the email controller
    super.dispose();
  }
}
