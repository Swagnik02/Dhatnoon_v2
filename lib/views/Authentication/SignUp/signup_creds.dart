// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_btn_ui.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_text_fields.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/OTP/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as devtools show log;

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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 20, 16, 40),
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
              ],
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
            )
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
}
