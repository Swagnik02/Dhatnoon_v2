// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Authentication/SignUp/signup_view.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/OTP/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'dart:developer' as devtools show log;

class OtpDailogue {
  void showTextFieldPopup(BuildContext context) {
    var code = "";
    final FirebaseAuth auth = FirebaseAuth.instance;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: ColorConstants.otpBg,
          title: Center(child: Text('Enter OTP')),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              // minWidth: 500,
              maxHeight: 154,
            ),
            child: Column(
              children: [
                Pinput(
                  length: 6,
                  pinAnimationType: PinAnimationType.slide,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                  cursor: cursor,
                  preFilledWidget: preFilledWidget,
                  onChanged: (value) {
                    code = value;
                  },
                  // validator: (pin) {
                  //   if (pin == '2224') return null;
                  //   return 'Pin is incorrect';
                  // },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
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
                ElevatedButton(
                  onPressed: () async {
                    try {
                      devtools.log(SignUpView.verify);
                      devtools.log(code);
                      // Create a PhoneAuthCredential with the code
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
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
                      Fluttertoast.showToast(
                        msg: "$e",
                      );
                      Fluttertoast.showToast(
                        msg: "Try again !!",
                      );
                    }
                  },
                  child: const Text('Verify'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
