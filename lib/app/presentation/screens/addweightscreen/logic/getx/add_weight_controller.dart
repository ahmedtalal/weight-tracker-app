import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/data/models/weight_model.dart';
import 'package:weight_tracker_task/app/data/repositories/firebase/fire_weight_repository_imp.dart';
import 'package:weight_tracker_task/app/domain/usecases/weight/weight_usecase.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/home_page.dart';


class AddWeightController extends GetxController{
  static final AddWeightController _addWeightController = AddWeightController._internal();
  AddWeightController._internal();
  static AddWeightController get instance => _addWeightController;

  var weight = "".obs;
  var date = "".obs;
  var isLoadingIcon = false.obs;

  onChangeWeight(String? newValue){
    weight.value = newValue!;
  }

  onValidateField(String value){
    if(value.isEmpty){
      return "this field is required";
    }
    return null ;
  }
  getTimeString() {
    String dateFormat = DateFormat("yyyy-MM-dd/HH:mm:ss").format(DateTime.now());
    date.value = dateFormat;
  }
  onClickConfirmWeightReport(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      _loadingIcon(true);
      String weightId = WeightModel.generateUserId();
      WeightModel weightEntity = WeightModel(
       weight: weight.value,
        weightId: weightId,
        userId: FirebaseAuth.instance.currentUser!.uid,
        date: date.value,
      );
      final result = await AddWeighttUseCase.instance.call(
        weightEntity,
        FireWeightRepositoryImp.instance,
      );
      if (result[mapKey].toString().toLowerCase() == "success") {
        Get.offAll(() => const HomePage());
        _loadingIcon(false);
      } else {
        _loadingIcon(false);
        return Get.snackbar(
          "add weight report Exception",
          result[mapValue],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColorsUtil.customColor6,
          colorText: Colors.white,
          borderRadius: 15,
          margin: const EdgeInsets.all(5),
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          icon: const Icon(Icons.error),
          messageText: Text(
            result[mapValue].toString(),
            style: const TextStyle(
              fontSize: 16,
              fontFamily: appFont,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleText: const Text(
            "add weight report Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } else {
      _loadingIcon(false);
    }
  }

  _loadingIcon(bool value) {
    isLoadingIcon.value = value;
  }
}