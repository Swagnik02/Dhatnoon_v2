import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/auth_text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfRegister extends StatelessWidget {
  const ProfRegister({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _userName = TextEditingController();
    TextEditingController _firstName = TextEditingController();
    TextEditingController _lastName = TextEditingController();
    // final auth = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: ColorConstants.authBackBtn,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 20, 16, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "What's your name ?",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 27),
                const Text(
                  "FIRST NAME",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                AuthTextField(controller: _firstName),
                const SizedBox(height: 27),
                const Text(
                  "LAST NAME",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                AuthTextField(controller: _lastName),
                const SizedBox(height: 27),
                const Text(
                  "USERNAME",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                AuthTextField(controller: _userName),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(msg: "Your message here");
        },
        child: const Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}




            // Column(

            //   children: [
            //     AuthBtnUI(
            //       onPressed: () {
            //         // Add your signup button action here
            //       },
            //       text: 'Sign Up & Accept',
            //     ),
            //   ],
            // ),