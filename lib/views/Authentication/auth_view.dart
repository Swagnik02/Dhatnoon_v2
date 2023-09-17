import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/views/Authentication/Login/login_mobile_view.dart';
import 'package:dhatnoon_v2/views/Authentication/SignUp/signup_view.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: ColorConstants.authBackground,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              SizedBox(
                width: 306,
                height: 580,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 223,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 303,
                          height: 200,
                          child: Image.asset(
                            'assets/logo.png',
                            width: 303,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          // REGISTER BUTTON
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0.98, 16),
                            width: 295.02,
                            height: 42,
                            decoration: BoxDecoration(
                              color: ColorConstants.authButtonActive,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpView(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.125,
                                  color: ColorConstants.authButtonInActive,
                                ),
                              ),
                            ),
                          ),
                          //LOGIN BUTTON
                          Container(
                            // autogroupfkrwLDP (NKsmH4b9TxU5Bm2SQYfkRw)
                            margin: const EdgeInsets.fromLTRB(0, 0, 0.98, 16),
                            width: 295.02,
                            height: 42,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.authButtonActive),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const LoginMobileView(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.125,
                                  color: ColorConstants.authButtonInActive,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}