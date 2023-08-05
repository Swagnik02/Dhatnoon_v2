// ignore_for_file: unnecessary_string_interpolations

import 'package:dhatnoon_v2/views/Authentication/SignUp/signup_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/color_constants.dart';
import 'dart:developer' as devtools show log;

import '../../../constants/routes.dart';
import 'OTP/pinput.dart';
import 'auth_text_controllers.dart';

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
          _showTextFieldPopup(context);
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

void _showTextFieldPopup(BuildContext context) {
  var code = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Text'),
        content: Column(
          children: [
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              onChanged: (value) {
                code = value;
              },
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => devtools.log(pin),
            ),
            TextButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Resend",
                );
              },
              child: const Text('Resend'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              try {
                // Create a PhoneAuthCredential with the code
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: SignUpView.verify, smsCode: code);

                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  mainRoute,
                  (route) => false,
                );
              } catch (e) {
                devtools.log('$e');
              }
            },
            child: const Text('Verify'),
          ),
        ],
      );
    },
  );
}
