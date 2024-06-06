import 'package:get/get.dart';
import 'package:contest_app/app/controller/list_controller.dart';
import 'package:contest_app/app/controller/counter_controller.dart';

class InitDep extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController());
    Get.lazyPut(() => ListController());
  }
}
