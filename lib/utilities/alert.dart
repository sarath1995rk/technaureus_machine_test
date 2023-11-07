import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:technaures_machine_test/common/palette.dart';

class Alert {
  static void showSnackBarWithAction(
      BuildContext context,
      String text,
      String actionLabel,
      VoidCallback onPressed, {
        Duration duration = const Duration(seconds: 2),
      }) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 12.0,
        content: Text(
          text,
        ),
        action: SnackBarAction(
          label: actionLabel,
          textColor: Palette.orange,
          onPressed: onPressed,
        ),
        duration: duration,
      ),
    );
  }

  static void showToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Palette.darkBlue,
      // textColor: kWhiteColor,
      fontSize: 15.0,
    );
  }
}