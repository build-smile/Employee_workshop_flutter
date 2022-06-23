import 'package:flutter/material.dart';

class AlertBar {
  static show(
      {required BuildContext context,
      required String msg,
      bool isError = false}) {
    SnackBar snackBar = SnackBar(
      backgroundColor: isError == true ? Colors.red : Colors.green,
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
