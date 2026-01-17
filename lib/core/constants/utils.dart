import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void showSuccessMessage(BuildContext context, String message) {
  if (kIsWeb) {
    _showWebToast(context, message);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,


      ),
    );
  }
}

void _showWebToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);

  final entry = OverlayEntry(
    builder: (_) => Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(const Duration(seconds: 2), () {
    entry.remove();
  });
}
