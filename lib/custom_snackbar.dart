import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void show({
    required String title,
    required String message,
    bool isSuccess = true,
  }) {
    if (title.isNotEmpty && message.isNotEmpty) {
      Get.snackbar(
        title,
        message,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      print("Snackbar title or message is empty.");
    }
  }
}

