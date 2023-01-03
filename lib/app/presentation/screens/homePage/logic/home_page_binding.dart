import 'package:get/get.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/logic/home__page_controller.dart';
class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController.instance, fenix: true);
  }
}
