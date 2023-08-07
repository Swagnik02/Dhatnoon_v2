import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget buildPrivacyAndTermsText() {
  return Center(
    child: Text.rich(
      textAlign: TextAlign.center,
      // textScaleFactor: 1.1,
      TextSpan(
        text: 'By tapping Sign Up, you acknowledge that\nyou have read the ',
        children: [
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              color: ColorConstants.privacyPolicyText,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // navigation
              },
          ),
          const TextSpan(text: ' and agree to the\n'),
          TextSpan(
            text: 'Terms of Service',
            style: const TextStyle(
              color: ColorConstants.privacyPolicyText,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //navigation
              },
          ),
          const TextSpan(text: '.'),
        ],
        style: const TextStyle(color: ColorConstants.authText, height: 1.5),
      ),
    ),
  );
}
