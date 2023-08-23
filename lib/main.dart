import 'package:dhatnoon_v2/views/Authentication/Login/login_mobile_view.dart';
import 'package:dhatnoon_v2/views/Authentication/SignUp/profile_register.dart';
import 'package:dhatnoon_v2/views/Authentication/SignUp/signup_creds.dart';
import 'package:dhatnoon_v2/views/Authentication/SignUp/signup_view.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_view.dart';
import 'package:dhatnoon_v2/views/Authentication/permission/permission.dart';
import 'package:dhatnoon_v2/views/Home/pages.dart';
import 'package:dhatnoon_v2/views/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants/routes.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Dhatnoon v2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FireInit(),
      routes: {
        authRoute: (context) => const AuthView(),
        homeRoute: (context) => const UserRequest(),
        loginRoute: (context) => const LoginMobileView(),
        signUpRoute: (context) => const SignUpView(),
        signUpCredRoute: (context) => const SignUpCreds(),
        regProfRoute: (context) => const ProfRegister(),
        permRoute: (context) => const Permission()
      },
    ),
  );
}

class FireInit extends StatelessWidget {
  const FireInit({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              return const HomePage();
            } else {
              return const AuthView();
            }

          default:
            return Container();
        }
      },
    );
  }
}
