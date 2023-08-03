import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../Login/login_mobile_view.dart';
import '../SignUp/signup_view.dart';

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpView(),
            ),
          );
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginMobileView(),
            ),
          );
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
