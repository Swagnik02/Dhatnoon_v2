import 'package:flutter/material.dart';
import 'package:dhatnoon_v2/constants/color_constants.dart';

class AuthBtnUI extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthBtnUI({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(188, 48),
        backgroundColor: ColorConstants.authButtonActive,
        elevation: 6,
        textStyle:
            const TextStyle(fontSize: 14, color: ColorConstants.authText),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
