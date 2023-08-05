// ignore_for_file: implementation_imports, prefer_const_constructors

import 'package:dhatnoon_v2/constants/routes.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'dart:developer' as devtools show log;

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App Name'),
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
          Text('Your main content goes here'),
          TextButton(
            onPressed: () {
              // _showTextFieldPopup(context);
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
