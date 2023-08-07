import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget buildSignUpLink(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text.rich(
        TextSpan(
          text: "Doesn't have an account?\n",
          style: const TextStyle(
            fontSize: 16,
            color: ColorConstants.authText,
          ),
          children: [
            TextSpan(
              text: "Sign Up",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorConstants.privacyPolicyText,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, signUpRoute, (route) => false);
                },
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}

Widget buildLogInLink(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text.rich(
        TextSpan(
          text: "Already have an account?\n",
          style: const TextStyle(
            fontSize: 16,
            color: ColorConstants.authText,
          ),
          children: [
            TextSpan(
              text: "Log In",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorConstants.privacyPolicyText,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, loginRoute, (route) => false);
                },
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
