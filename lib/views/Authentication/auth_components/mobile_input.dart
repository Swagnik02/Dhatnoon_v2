// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';
import 'auth_text_controllers.dart';

Widget buildMobileInput(AuthTextControllers authTextControllers) {
  return Center(
    child: Container(
      height: 48,
      width: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorConstants.authTextFieldBg),
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 45,
            child: TextField(
              controller: authTextControllers.countryCodeController,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: ColorConstants.authText,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            "|",
            style: TextStyle(fontSize: 33, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              controller: authTextControllers.phoneController,
              decoration: InputDecoration(
                  hintText: "Phone",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10)),
              style: TextStyle(
                color: ColorConstants.authText,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
