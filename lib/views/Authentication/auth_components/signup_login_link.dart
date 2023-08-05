import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';

Widget buildSignUpLink(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        "Doesn't have an account?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: ColorConstants.authText,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, signUpRoute, (route) => false);
        },
        child: const Text(
          "Sign Up",
          style: TextStyle(
            fontSize: 16,
            color: ColorConstants.privacyPolicyText,
          ),
        ),
      ),
    ],
  );
}

Widget buildLogInLink(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        "Already have an account?",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: ColorConstants.authText,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, loginRoute, (route) => false);
        },
        child: const Text(
          "Log In",
          style: TextStyle(
            fontSize: 16,
            color: ColorConstants.privacyPolicyText,
          ),
        ),
      ),
    ],
  );
}
