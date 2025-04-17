import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

class ToastMessage {
  static showSuccessMessage(BuildContext context, String message) {
    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      title: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      primaryColor: Colors.white,
      backgroundColor: Colors.green,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static showErrorMessage(BuildContext context, String message) {
    toastification.show(
      icon: const Icon(
        Icons.error_outline,
      ),
      context: context,
      title: Text(
        message,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      primaryColor: Colors.white,
      backgroundColor: Colors.red,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
