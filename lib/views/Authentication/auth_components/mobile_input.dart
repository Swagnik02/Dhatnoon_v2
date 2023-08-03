import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';

Widget buildMobileInput(TextEditingController phoneController) {
  return Container(
    margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            cursorColor: ColorConstants.authText,
            controller: phoneController, // Use the passed controller here
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorConstants.authText,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorConstants.authTextFieldBg,
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
