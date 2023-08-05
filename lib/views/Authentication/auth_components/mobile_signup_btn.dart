import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/color_constants.dart';

Widget buildSignUpButton(BuildContext context,
    TextEditingController phoneController, Function(String) verifyPhoneNumber) {
  return ElevatedButton(
    onPressed: () {
      String phoneNumber = phoneController.text.trim();
      Navigator.pushNamed(context, otpRoute);
      if (phoneNumber.isNotEmpty) {
        verifyPhoneNumber(phoneNumber);
      } else {
        // Show a message or dialog indicating that the phone number is empty.
        // You can use a SnackBar or showDialog to display the message.
        Fluttertoast.showToast(msg: "Phone number is empty.");
      }
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
