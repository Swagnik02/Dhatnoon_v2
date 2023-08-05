import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/color_constants.dart';
import 'dart:developer' as devtools show log;

import '../../../constants/routes.dart';
import 'auth_text_controllers.dart';

Widget buildLoginButton(
    BuildContext context, AuthTextControllers authTextControllers) {
  return ElevatedButton(
    onPressed: () async {
      devtools.log(
          'Mobile number: ${authTextControllers.countryCodeController.text + authTextControllers.phoneController.text}');

      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber:
      //       '${authTextControllers.countryCodeController.text + authTextControllers.phoneController.text}',
      //   verificationCompleted: (PhoneAuthCredential credential) {},
      //   verificationFailed: (FirebaseAuthException e) {},
      //   codeSent: (String verificationId, int? resendToken) {},
      //   codeAutoRetrievalTimeout: (String verificationId) {},
      // );
      Fluttertoast.showToast(msg: "OTP sent !!");
      Navigator.pushNamed(context, otpRoute);

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
      'Log In',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
