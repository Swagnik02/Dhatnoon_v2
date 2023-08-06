import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constants/color_constants.dart';
import 'dart:developer' as devtools show log;

import 'OTP/otp.dart';
import 'auth_text_controllers.dart';

Widget buildSignUpButton(
    BuildContext context, AuthTextControllers authTextControllers) {
  return ElevatedButton(
    onPressed: () async {
      final String mob = authTextControllers.countryCodeController.text +
          authTextControllers.phoneController.text;
      devtools.log('Mobile number: $mob');
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mob,
        // '${authTextControllers.countryCodeController.text + authTextControllers.phoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          OtpDailogue otpDailogue = OtpDailogue();
          otpDailogue.showTextFieldPopup(context);
          OtpDailogue.verify = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      Fluttertoast.showToast(msg: "OTP sent !!");
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
