import 'package:flutter/material.dart';

class CustomSnakBar {
  static void show(BuildContext context, String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? Colors.grey,
      ),
    );
  }
}
