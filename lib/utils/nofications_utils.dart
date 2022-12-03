import 'package:flutter/material.dart';

class NotificationUtils {
  static void showSnackbar(BuildContext context,
      {required String message, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
