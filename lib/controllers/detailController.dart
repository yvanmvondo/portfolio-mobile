import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var love = 0.obs;

  void loveCounter() {
    if(love.value == 1) {
      Get.snackbar(
        "Favorie", 
        "Vous aimez deja",
        icon: const Icon(Icons.alarm),
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.shade300
      );
    } else {
      love.value++;
      Get.snackbar(
        "Favorie",
        "Vous adorez",
      );
    }
  }
} 