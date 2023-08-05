import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import 'dart:developer' as devtools show log;

Widget buildSignUpButton(
    BuildContext context,
    TextEditingController countryCodeController,
    TextEditingController phoneController) {
  return ElevatedButton(
    onPressed: () async {
      print(countryCodeController.text);
      print(phoneController.text);
      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber: ,
      //   verificationCompleted: (PhoneAuthCredential credential) {},
      //   verificationFailed: (FirebaseAuthException e) {},
      //   codeSent: (String verificationId, int? resendToken) {},
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // );
      // Navigator.pushNamed(context, otpRoute);

      // if (phoneNumber.isNotEmpty) {
      //   verifyPhoneNumber(phoneNumber);
      // } else {
      //   // Show a message or dialog indicating that the phone number is empty.
      //   // You can use a SnackBar or showDialog to display the message.
      //   Fluttertoast.showToast(msg: "Phone number is empty.");
      // }
    },
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(188, 48),
      backgroundColor: ColorConstants.authButtonActive,
      elevation: 6,
      textStyle: const TextStyle(fontSize: 14, color: ColorConstants.authText),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    ),
    child: const Text(
      'Sign Up',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
