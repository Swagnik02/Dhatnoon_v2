import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';

Widget buildMobileInput(TextEditingController phoneController) {
  return Center(
    child: SizedBox(
      width: 260,
      height: 48,
      child: TextFormField(
        keyboardType: TextInputType.number,
        cursorColor: ColorConstants.authText,
        controller: phoneController, // Use the passed controller here
        style: const TextStyle(
          fontSize: 17, // Updated font size to 15
          fontWeight: FontWeight.bold,
          color: ColorConstants.authText,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstants.authTextFieldBg,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15, // Updated font size to 15
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Set border radius here
            borderSide: BorderSide.none, // Remove the borders
          ),
        ),
      ),
    ),
  );
}
