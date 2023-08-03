import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../Login/login_email_view.dart';
import '../Login/login_mobile_view.dart';

Widget buildLoginUsingEmail(BuildContext context) {
  return Text.rich(
    TextSpan(
      text: 'Login using ',
      children: [
        TextSpan(
          text: 'email',
          style: const TextStyle(
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
        color: ColorConstants.authText,
      ),
    ),
  );
}
