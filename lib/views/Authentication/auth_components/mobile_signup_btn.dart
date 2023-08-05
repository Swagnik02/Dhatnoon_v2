// ignore_for_file: unnecessary_string_interpolations

import 'package:dhatnoon_v2/views/Authentication/SignUp/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/color_constants.dart';
import 'dart:developer' as devtools show log;

import '../../../constants/routes.dart';
import 'auth_text_controllers.dart';
import 'otp.dart';

Widget buildSignUpButton(
    BuildContext context, AuthTextControllers authTextControllers) {
  return ElevatedButton(
    onPressed: () async {
      devtools.log(
          'Mobile number: ${authTextControllers.countryCodeController.text + authTextControllers.phoneController.text}');

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:
            '${authTextControllers.countryCodeController.text + authTextControllers.phoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          SignUpView.verify = verificationId;
          // Navigator.pushNamed(context, otpRoute);
          _showOTPScreen(context);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      Fluttertoast.showToast(msg: "OTP sent !!");
      // if (phoneNumber.isNotEmpty) {
      //   verifyPhoneNumber(phoneNumber);
      // } else {
      //   // Show a message or dialog indicating that the phone number is empty.
      //   // You can use a SnackBar or showDialog to display the message.
      //   Fluttertoast.showToast(msg: "Phone number is empty.");
      //
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

void _showOTPScreen(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return const OTPScreen();
    },
  );
}
