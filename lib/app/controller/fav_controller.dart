import 'package:get/get.dart';

class FavController extends GetxController {
  RxInt fav = 0.obs;

  void favCounter() {
    if (fav.value == 1) {
      Get.snackbar("Loved it", "You already loved it");
    } else {
      fav.value++;
      Get.snackbar("Loved it", "You just loved it");
    }
  }
}
