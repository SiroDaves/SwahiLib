import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(
    BuildContext context,
    String feedback, {
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    bool isSuccess = false,
    Duration duration = const Duration(seconds: 5),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: isSuccess ? Colors.green : Colors.red,
          content: Text(
            feedback,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
  }
}
