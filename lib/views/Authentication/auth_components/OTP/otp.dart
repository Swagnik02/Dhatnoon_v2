// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/OTP/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'dart:developer' as devtools show log;

class OtpDailogue {
  static UserCredential? authCReds;
  static User? mobileUser;
  static String verify = "";
  void showTextFieldPopup(BuildContext context) {
    var code = "";
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
                      devtools.log(verify);
                      devtools.log(code);

                      // Create a PhoneAuthCredential with the code
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: verify,
                        smsCode: code,
                      );

                      // Sign in (or link) the user with the credential
                      final authResult = await FirebaseAuth.instance
                          .signInWithCredential(credential);
                      final user = authResult.user;
                      authCReds = authResult;
                      mobileUser = FirebaseAuth.instance.currentUser;
                      // Check if the user has a display name set
                      final username =
                          user?.displayName; // Use the null-aware operator (?)

                      if (username != null) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          homeRoute,
                          (route) => false,
                        );
                      } else {
                        // Create a Firestore document with the user's phone number
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(user?.uid)
                            .set({
                          'phoneNumber': user?.phoneNumber,
                        });
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          signUpCredRoute,
                          (route) => false,
                        );
                      }

                      devtools.log('UserID : $user?.uid');
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
