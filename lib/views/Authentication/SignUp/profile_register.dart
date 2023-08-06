import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/CustomTemplates/auth_btn_ui.dart';
import 'package:dhatnoon_v2/views/Authentication/auth_components/auth_text_fields.dart';
import 'package:flutter/material.dart';

class ProfRegister extends StatelessWidget {
  const ProfRegister({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstName = TextEditingController();
    TextEditingController _lastName = TextEditingController();
    return Scaffold(
      backgroundColor: ColorConstants.authBackground,
      appBar: AppBar(
        elevation: 0, // Set elevation to 0 to remove shadow from the app bar
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: ColorConstants.authBackBtn,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "What's your name ?",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            const SizedBox(height: 27),
            //FIRST NAME
            const Text(
              "FIRST NAME",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            AuthTextField(controller: _firstName),
            //LAST NAME
            const SizedBox(height: 27),
            const Text(
              "LAST NAME",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 5),
            AuthTextField(controller: _lastName),

            const SizedBox(height: 20),
            AuthBtnUI(
              onPressed: () {
                // Add your signup button action here
              },
              text: 'Sign Up & Accept',
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
