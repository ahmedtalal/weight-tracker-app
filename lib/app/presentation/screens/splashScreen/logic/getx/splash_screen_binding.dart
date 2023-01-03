import 'package:get/get.dart';
import 'package:weight_tracker_task/app/presentation/screens/splashScreen/logic/getx/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController.instance, fenix: true);
  }
}
