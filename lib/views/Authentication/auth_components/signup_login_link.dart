import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../Login/login_mobile_view.dart';
import '../SignUp/signup_view.dart';

Widget buildSignUpLink(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        const TextSpan(
          text: "Doesn't have an account? ",
          style: TextStyle(
            fontSize: 12,
            color: ColorConstants.authText,
          ),
        ),
        TextSpan(
          text: "Sign Up",
          style: const TextStyle(
            fontSize: 12,
            color: ColorConstants.privacyPolicyText,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpView(),
                ),
              );
            },
        ),
      ],
    ),
  );
}

Widget buildLogInLink(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        const TextSpan(
          text: "Already have an account? ",
          style: TextStyle(
            fontSize: 12,
            color: ColorConstants.authText,
          ),
        ),
        TextSpan(
          text: "Log In",
          style: const TextStyle(
            fontSize: 12,
            color: ColorConstants.privacyPolicyText,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginMobileView(),
                ),
              );
            },
        ),
      ],
    ),
  );
}
