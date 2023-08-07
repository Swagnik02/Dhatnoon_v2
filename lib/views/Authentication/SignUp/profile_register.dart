// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfRegister extends StatelessWidget {
  const ProfRegister({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _userName = TextEditingController();
    TextEditingController _firstName = TextEditingController();
    TextEditingController _lastName = TextEditingController();

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
                    "What's your name ?",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 27),
                const Text(
                  "FIRST NAME",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                AuthTextField(controller: _firstName),
                const SizedBox(height: 27),
                const Text(
                  "LAST NAME",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                AuthTextField(controller: _lastName),
                const SizedBox(height: 27),
                const Text(
                  "USERNAME",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                AuthTextField(controller: _userName),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Get the data from the text fields
          String firstName = _firstName.text;
          String lastName = _lastName.text;
          String userName = _userName.text;

          // Update the user's displayName in Firebase Auth
          try {
            User? user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              // Update the display name
              await user.updateDisplayName(userName);

              Fluttertoast.showToast(msg: "username: ${user.displayName}");

              // Display a success message
              Fluttertoast.showToast(msg: "Username updated successfully!");

              // Get the user's UID
              String uid = user.uid;

              // Create a reference to the Firestore document with the user's UID as the document ID
              DocumentReference docRef =
                  FirebaseFirestore.instance.collection('Users').doc(uid);

              // Update the document with the new data
              await docRef.set({
                'FirstName': firstName,
                'LastName': lastName,
              }).then((_) {
                // Data successfully written to the database
                Fluttertoast.showToast(msg: "Data updated successfully!");
              }).catchError((error) {
                Fluttertoast.showToast(msg: "Failed to update data: $error");
                // Handle any errors that occurred while writing to the database
              });

              // Navigate to the home screen
              Navigator.pushNamedAndRemoveUntil(
                context,
                homeRoute,
                (route) => false,
              );
            } else {
              Fluttertoast.showToast(
                  msg: "User not found. Please log in again.");
            }
          } catch (error) {
            Fluttertoast.showToast(msg: "Failed to update username: $error");
          }
        },
        child: const Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}
