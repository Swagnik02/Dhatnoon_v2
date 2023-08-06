import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ProfRegister extends StatelessWidget {
  const ProfRegister({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              width: 392.72727272727275,
              height: 40,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide.none,
                  left: BorderSide.none,
                  right: BorderSide.none,
                  bottom: BorderSide.none,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '|',
                    style: TextStyle(color: ColorConstants.authText),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 1.8),
                    child: SizedBox(
                      width: 392.72727272727275 - 42.5,
                      child: TextField(
                        style: TextStyle(color: ColorConstants.authText),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstants.authText, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorConstants.authText, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(color: ColorConstants.authText),
                  ),
                ],
              ),
            ),
            //LAST NAME
            const SizedBox(height: 27),
            const Text("Last Name",
                style: TextStyle(color: Colors.white, fontSize: 15)),
            const SizedBox(height: 5),
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter your last name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your signup button action here
                  },
                  child: const Text("Sign Up"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add your accept button action here
                  },
                  child: const Text("Accept"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
