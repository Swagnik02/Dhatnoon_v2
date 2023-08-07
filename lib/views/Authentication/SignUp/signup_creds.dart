import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_btn_ui.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

      // Create user with email and password using FirebaseAuth
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the user already exists (e.g., signed up using phone number)
      if (userCredential.additionalUserInfo!.isNewUser) {
        // New user, no need to link accounts
        // Continue with the code to store user data
        String uid = userCredential.user!.uid;
        DocumentReference docRef =
            FirebaseFirestore.instance.collection('Users').doc(uid);

        // Update the document with the new data
        await docRef.set({
          'Email': email,
        }).then((_) {
          // Data successfully written to the database
          Fluttertoast.showToast(msg: "Data updated successfully!");
        }).catchError((error) {
          Fluttertoast.showToast(msg: "Failed to update data: $error");
        });

        // Navigate to the home screen
        Navigator.pushNamedAndRemoveUntil(
          context,
          regProfRoute,
          (route) => false,
        );
      } else {
        // Existing user, link email credentials to the existing account
        User user = FirebaseAuth.instance.currentUser!;
        AuthCredential credential = EmailAuthProvider.credential(
          email: email,
          password: password,
        );

        user.linkWithCredential(credential).then((userCred) {
          // Successfully linked email credentials to the existing account
          String uid = userCred.user!.uid;
          DocumentReference docRef =
              FirebaseFirestore.instance.collection('Users').doc(uid);

          // Update the document with the new data
          docRef.set({
            'Email': email,
          }).then((_) {
            // Data successfully written to the database
            Fluttertoast.showToast(msg: "Data updated successfully!");
          }).catchError((error) {
            Fluttertoast.showToast(msg: "Failed to update data: $error");
          });

          // Navigate to the home screen
          Navigator.pushNamedAndRemoveUntil(
            context,
            regProfRoute,
            (route) => false,
          );
        }).catchError((error) {
          // Handle error if linking fails
          Fluttertoast.showToast(msg: "Failed to link email: $error");
        });
      }
    } catch (error) {
      Fluttertoast.showToast(msg: "Failed to sign up: $error");
    }
  }
}
