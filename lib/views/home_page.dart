// ignore_for_file: implementation_imports, prefer_const_constructors

import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Authentication/homePage/send_req_view.dart';

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
    var _selectedNavIndex = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: ColorConstants.authBackground,
        title: Text(
          '${user?.displayName}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              signOutAndNavigateToAuth(context);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedNavIndex = value;
          });
          if (_selectedNavIndex == 0) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          } else if (_selectedNavIndex == 1) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SendReqView(),
                ));
          }
        },
        currentIndex: _selectedNavIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Send Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task_rounded),
            label: 'Accept Request',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              children: [
                const Text(
                  "Users",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
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

void signOutAndNavigateToAuth(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  if (context.mounted) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      authRoute,
      (_) => false,
    );
  }
}

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('HomePage'),
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.logout),
    //         onPressed: () {
    //           signOutAndNavigateToAuth(context);
    //         },
    //       ),
    //     ],
    //   ),
    //   body: Center(
    //     child: Column(children: [
    //       SizedBox(height: 50),
    //       Text('Account Details'),
    //       Text('${user?.uid}'),
    //       Text('${user?.displayName}'),
    //       Text('${user?.phoneNumber}'),
    //       Text('${user?.email}'),
    //       TextButton(
    //         onPressed: () {
    //           if (context.mounted) {
    //             Navigator.of(context).pushNamedAndRemoveUntil(
    //               regProfRoute,
    //               (_) => false,
    //             );
    //           }
    //         },
    //         child: Text('Open Popup'),
    //       )
    //     ]),
    //   ),
    // );