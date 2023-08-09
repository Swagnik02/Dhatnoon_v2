import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/views/Authentication/Login/login_email_view.dart';
import 'package:dhatnoon_v2/views/Authentication/Login/login_mobile_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Widget buildLoginUsingEmail(BuildContext context) {
  return Text.rich(
    TextSpan(
      text: 'Login using ',
      children: [
        TextSpan(
          text: 'Email',
          style: const TextStyle(
            fontSize: 16,
            color: ColorConstants.privacyPolicyText,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Handle navigation to LoginEmailView page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginEmailView(),
                ),
              );
            },
        ),
      ],
      style: const TextStyle(
        fontSize: 16,
        color: ColorConstants.authText,
      ),
    ),
  );
}

Widget buildLoginUsingMobile(BuildContext context) {
  return Text.rich(
    TextSpan(
      text: 'Login using ',
      children: [
        TextSpan(
          text: 'Mobile',
          style: const TextStyle(
            fontSize: 23,
            color: ColorConstants.privacyPolicyText,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // Handle navigation to LoginMobileView page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginMobileView(),
                ),
              );
            },
        ),
      ],
      style: const TextStyle(
        fontSize: 23,
        color: ColorConstants.authText,
      ),
    ),
  );
}
