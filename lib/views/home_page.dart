// ignore_for_file: implementation_imports, prefer_const_constructors

import 'package:dhatnoon_v2/constants/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'dart:developer' as devtools show log;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user; // Move the user variable inside the state class

  @override
  void initState() {
    super.initState();
    user =
        FirebaseAuth.instance.currentUser; // Initialize the user in initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              signOutAndNavigateToAuth(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 50),
          Text('Account Details'),
          Text('${user?.uid}'),
          Text('${user?.displayName}'),
          Text('${user?.phoneNumber}'),
          Text('${user?.email}'),
          TextButton(
            onPressed: () {
              if (context.mounted) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  regProfRoute,
                  (_) => false,
                );
              }
            },
            child: Text('Open Popup'),
          )
        ]),
      ),
    );
  }
}

void signOutAndNavigateToAuth(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  if (context.mounted) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      authRoute,
      (_) => false,
    );
  }
}
