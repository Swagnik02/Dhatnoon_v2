import 'package:dhatnoon_v2/views/register_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // You can add your login logic here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your login form widgets can be added here

            ElevatedButton(
              onPressed: () {
                // Add your login logic here when the login button is pressed
              },
              child: const Text('Login'),
            ),

            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                // Navigate to the signup page when the "Navigate to Signup" button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterView(),
                  ),
                );
              },
              child: const Text('Navigate to Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
