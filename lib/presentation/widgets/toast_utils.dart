import 'package:flutter/material.dart';

class ToastUtils {
  static void showSuccess(BuildContext context, String title, String message) {
    _showSnackBar(context, title, message, Colors.green, Icons.check_circle);
  }

  static void showError(BuildContext context, String title, String message) {
    _showSnackBar(context, title, message, Colors.red, Icons.error);
  }

  static void showWarning(BuildContext context, String title, String message) {
    _showSnackBar(context, title, message, Colors.orange, Icons.warning);
  }

  static void _showSnackBar(BuildContext context, String title, String message,
      Color backgroundColor, IconData icon) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text(message, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Icon(icon, color: Colors.white),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
