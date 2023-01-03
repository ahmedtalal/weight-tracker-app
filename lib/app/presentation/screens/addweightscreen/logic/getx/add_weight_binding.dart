import 'package:get/get.dart';
import 'package:weight_tracker_task/app/presentation/screens/addweightscreen/logic/getx/add_weight_controller.dart';

class AddWeightBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => AddWeightController.instance,fenix: true);
  }


}