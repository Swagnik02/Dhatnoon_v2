import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/constants/routes.dart';
import 'package:dhatnoon_v2/views/Home/accept_request.dart';
import 'package:dhatnoon_v2/views/Home/home.dart';
import 'package:dhatnoon_v2/views/Home/request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRequest extends StatefulWidget {
  const UserRequest({super.key});

  @override
  State<UserRequest> createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  User? user = FirebaseAuth.instance.currentUser;
  int currentIndex = 0;
  List pages = [const Home(), const SendRequest(), const AcceptRequest()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          '${user?.displayName}'.toUpperCase(),
          style: const TextStyle(
            color: ColorConstants.authText,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              signOutAndNavigateToAuth(context);
            },
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black12,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          selectedItemColor: ColorConstants.authButtonActive,
          unselectedItemColor: ColorConstants.authText,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                icon: Icon(Icons.send), label: "Send Request"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_task_rounded), label: "Accept Request")
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorConstants.authButtonActive,
        foregroundColor: ColorConstants.authText,
        child: const Icon(Icons.add),
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
