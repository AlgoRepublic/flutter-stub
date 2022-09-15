import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global_constants.dart';

class Utils {
  static showSnackBar(String msg, SnackBarType type,
      {bool isInternetError = false}) {
    Get.showSnackbar(GetSnackBar(
      snackStyle: SnackStyle.FLOATING,
      messageText: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      borderRadius: 75,
      backgroundColor: type == SnackBarType.error
          ? const Color(0xffCA7E8D)
          : const Color(0xff70AE98),
      duration: Duration(
          seconds: isInternetError
              ? 6
              : msg.length > 50
                  ? 4
                  : 3),
      isDismissible: true,
    ));
  }
}
