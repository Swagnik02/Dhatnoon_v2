import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

@override
showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 18);
}
