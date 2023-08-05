import 'package:dhatnoon_v2/views/Authentication/auth_components/otp.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_view.dart';
import 'package:dhatnoon_v2/views/main_view.dart';
import 'package:dhatnoon_v2/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constants/routes.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthView(),
      routes: {
        mainRoute: (context) => const MainView(),
        // loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        otpRoute: (context) => const OTPScreen(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              return const MainView();
            } else {
              return const AuthView();
            }

          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
