import 'package:flutter/material.dart';

class AlertHelper {
  static showBar(
      {required BuildContext context,
      required String msg,
      bool isError = false}) {
    SnackBar snackBar = SnackBar(
      backgroundColor: isError == true ? Colors.red : Colors.green,
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static alertPopup(
      {required BuildContext context,
      required Function function,
      required String title,
      bool closeAuto = true,
      String desc = ''}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(desc),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              function();
              if (closeAuto) {
                Navigator.pop(context, 'OK');
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
