import 'package:get/get.dart';

class CounterController extends GetxController {
  int _x = 0;
  int get x => _x;

  RxInt _y = 0.obs;
  RxInt get y => _y;
  RxInt _z = 0.obs;

  RxInt get z => _z;

  void incrementY() {
    _y.value++;
  }

  void decrementY() {
    _y.value--;
  }

  void increment() {
    _x++;
    update();
    print(_x);
  }

  void decrement() {
    _x--;
    update();
  }

  void total() {
    z.value = _x + _y.value;
  }
}
