import 'package:get/get.dart';
import 'package:contest_app/app/controller/list_controller.dart';
import 'package:contest_app/app/controller/counter_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => CounterController());
  Get.lazyPut(() => ListController());
}
