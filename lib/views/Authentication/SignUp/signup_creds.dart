// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Authentication/SignUp/profile_register.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_btn_ui.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_text_fields.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/OTP/otp.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as devtools show log;

import 'google_signup.dart';

class SignUpCreds extends StatefulWidget {
  const SignUpCreds({super.key});

  @override
  State<SignUpCreds> createState() => _SignUpCredsState();
}

class _SignUpCredsState extends State<SignUpCreds> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: ColorConstants.authBackBtn,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthView()
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20, 10,260),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Credentials",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  const SizedBox(height: 27),
                  const Text(
                    "Email ID: ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  AuthTextField(controller: _email),
                  const SizedBox(height: 27),
                  const Text(
                    "Password",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  AuthTextField(controller: _password),
                ]

            ),
            Column(
              children: [
                AuthBtnUI(
                  text: 'Continue',
                  onPressed: () {
                    voidSignUpWithEmail(
                      context,
                      _email,
                      _password,
                    );
                  },
                ),
              ],
            ),
            Column(
              children: [
                const Text(

                  "Log In or Sign Up",
                  style: TextStyle(
                    fontSize: 18,
                    color: ColorConstants.authText,
                  ),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () async{
                    await AuthService().signInWithGoogle();
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>ProfRegister()));
                  },

                  //   onTap: ()=>AuthService().signInWithGoogle(){
                  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
                  // },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/google-logo.png',
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  void voidSignUpWithEmail(BuildContext context, TextEditingController _email,
      TextEditingController _password) async {
    try {
      // Get the data from the text fields
      String password = _password.text;
      String email = _email.text;

      registerUser(password, email);
      // mobile uid
      devtools.log("Mobile User ID: ${FirebaseAuth.instance.currentUser?.uid}");
      devtools.log("Mobile User: ${OtpDailogue.mobileUser}");

// Create the AuthCredential object
      AuthCredential emailCreds = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      UserCredential? userCredential =
      await OtpDailogue.mobileUser?.linkWithCredential(emailCreds);

      final emailUID = FirebaseAuth.instance.currentUser?.uid;
      devtools.log("EMAIL User ID: $emailUID");
      devtools.log("EMAIL AUTH CREDS: $emailCreds");
      devtools.log("EMAIL USER: ${FirebaseAuth.instance.currentUser}");

      // Navigate to the home screen
      Navigator.pushNamedAndRemoveUntil(
        context,
        regProfRoute,
            (route) => false,
      );
    } catch (error) {
      Fluttertoast.showToast(msg: "Failed to sign up: $error");
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registration successful
      User? user = userCredential.user;
      print('Registered user: ${user?.uid}');
    } catch (e) {
      // Handle registration errors
      if (e is FirebaseAuthException) {
        print('Registration error: ${e.message}');
      }
    }
  }

  Future<void> linkCredentials(User currentUser, AuthCredential credential) async {
    try {
      await currentUser.linkWithCredential(credential);
      print("Credentials linked successfully.");
    } catch (e) {
      print("Linking Error: $e");
    }
  }
}