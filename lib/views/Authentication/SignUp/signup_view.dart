import 'package:dhatnoon_v2/views/Authentication/auth_components/auth_text_controllers.dart';

import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../auth_components/mobile_input.dart';
import '../auth_components/mobile_signup_btn.dart';
import '../auth_components/signup_login_link.dart';

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
              // buildLoginUsingEmail(context), privacy t&C
              const SizedBox(height: 111),
              buildSignUpButton(context, authTextControllers),
              const SizedBox(height: 16),
              buildLogInLink(context),
              const SizedBox(height: 56),
              const Text(
                "Log In or Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  color: ColorConstants.authText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'assets/google-logo.png',
                  width: 45,
                  height: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
