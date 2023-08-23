import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              children: [
                const Text(
                  "Users",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Text('uid: ${user?.uid}',
                        style: const TextStyle(color: Colors.white)),
                    Text('User: ${user?.displayName}',
                        style: const TextStyle(color: Colors.white)),
                    Text('mail: ${user?.email}',
                        style: const TextStyle(color: Colors.white)),
                    Text('mob: ${user?.phoneNumber}',
                        style: const TextStyle(color: Colors.white)),
                    Text('Verification status: ${user?.emailVerified}',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
