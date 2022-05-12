import 'package:get/get.dart';

class DetailController extends GetxController {
  var love = 0.obs;

  void loveCounter() {
    if(love.value == 1) {
      Get.snackbar("J'aime", "Vous aimez deja");
    } else {
      love.value++;
      Get.snackbar("J'aime", "Vous adorez");
    }
  }
} 