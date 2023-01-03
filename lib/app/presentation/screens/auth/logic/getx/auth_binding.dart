import 'package:get/get.dart';
import 'package:weight_tracker_task/app/presentation/screens/auth/logic/getx/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController.instance,fenix: true);
  }

}