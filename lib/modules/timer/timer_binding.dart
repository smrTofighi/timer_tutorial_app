import 'package:get/get.dart';
import 'package:timer_tutorial_app/modules/timer/timer_controller.dart';

class TimerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TimerController());
  }

}