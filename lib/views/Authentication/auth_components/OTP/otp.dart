// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Authentication/SignUp/signup_view.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/OTP/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'dart:developer' as devtools show log;

// class OTPScreen extends StatefulWidget {
//   const OTPScreen({super.key});
//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }

// var code = "";

// class _OTPScreenState extends State<OTPScreen> {
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 100,
//           ),
//           Text('Enter Otp'),
//           Pinput(
//             length: 6,
//             defaultPinTheme: defaultPinTheme,
//             focusedPinTheme: focusedPinTheme,
//             submittedPinTheme: submittedPinTheme,
//             onChanged: (value) {
//               code = value;
//             },
//             validator: (s) {
//               return s == '2222' ? null : 'Pin is incorrect';
//             },
//             pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//             showCursor: true,
//             onCompleted: (pin) => devtools.log(pin),
//           ),
//           TextButton(
//             onPressed: () {
//               Fluttertoast.showToast(
//                 msg: "Resend",
//               );
//             },
//             child: Text('Resend'),
//           ),
//           TextButton(
//             onPressed: () async {
//               try {
//                 // Create a PhoneAuthCredential with the code
//                 PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                     verificationId: SignUpView.verify, smsCode: code);

//                 // Sign the user in (or link) with the credential
//                 await auth.signInWithCredential(credential);
//                 Navigator.pushNamedAndRemoveUntil(
//                   context,
//                   mainRoute,
//                   (route) => false,
//                 );
//               } catch (e) {
//                 devtools.log('$e');
//               }
//             },
//             child: Text('Verify'),
//           ),
//         ],
//       ),
//     ));
//   }
// }

class OtpDailogue {
  void showTextFieldPopup(BuildContext context) {
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
}
