import 'package:dhatnoon_v2/constants/color_constants.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;

  const AuthTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            '|',
            style: TextStyle(color: ColorConstants.authText),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 1.8),
            child: SizedBox(
              width: 392.72727272727275 - 42.5,
              child: TextField(
                controller: controller,
                style: const TextStyle(color: ColorConstants.authText),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstants.authText, width: 1),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstants.authText, width: 1),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            '|',
            style: TextStyle(color: ColorConstants.authText),
          ),
        ],
      ),
    );
  }
}
