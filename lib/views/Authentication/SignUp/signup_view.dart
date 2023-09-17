
import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/auth_buttons/mobile_signup_btn.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/auth_text_controllers.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/mobile_input.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/privacy_t&c.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/signup_login_link.dart';


import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  // static String verify = "";
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  AuthTextControllers authTextControllers = AuthTextControllers();

  final TextEditingController _otpController = TextEditingController();
  String? verificationId;
  bool isSignUp = false;

  @override
  void initState() {
    authTextControllers.countryCodeController.text = "+91";
    super.initState();
  }

  @override
  void dispose() {
    authTextControllers.phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 150),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 32,
                  color: ColorConstants.authText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(70, 0, 0, 10),
                    child: Text(
                      "Mobile",
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorConstants.authText,
                      ),
                    ),
                  ),
                  buildMobileInput(authTextControllers),
                ],
              ),
              const SizedBox(height: 20),
              buildPrivacyAndTermsText(),
              const SizedBox(height: 64),
              buildSignUpButton(context, authTextControllers),
              const SizedBox(height: 16),
              buildLogInLink(context),
            ],
          ),
        ),
      ),
    );
  }
}
