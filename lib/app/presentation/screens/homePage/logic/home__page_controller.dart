// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/data/models/weight_model.dart';
import 'package:weight_tracker_task/app/data/repositories/firebase/fire_weight_repository_imp.dart';
import 'package:weight_tracker_task/app/domain/entities/weight_entity.dart';
import 'package:weight_tracker_task/app/domain/usecases/weight/weight_usecase.dart';
import 'package:weight_tracker_task/app/presentation/screens/addweightscreen/logic/getx/add_weight_controller.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/home_page.dart';

class HomePageController extends GetxController {
  static final HomePageController _homeController=
  HomePageController._internal();
  HomePageController._internal();
  static HomePageController get instance => _homeController;

  var weightReportsList = <WeightEntity>[].obs;
  var isLoading = false.obs;
  var weight = "".obs;
  var date = "".obs;

  onChangeWeight(String? newValue){
    weight.value = newValue!;
  }

  onValidateField(String value){
    if(value.isEmpty){
      return "this field is required";
    }
    return null ;
  }
  getAllWeightReports() async {
    try {
      weightReportsList.clear();
      isLoading(true);
      final result = await GetAllIWeightReportsUseCase.instance
          .call(FireWeightRepositoryImp.instance);
      if (result[mapKey].toString().toLowerCase() == "success") {
        weightReportsList.addAll(result[mapValue]);
        print(result[mapValue].toString());
      } else {
        isLoading(false);
        return Get.snackbar(
          "weight reports Exception",
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
            "weight reports Exception",
            style: TextStyle(
              fontSize: 20,
              fontFamily: appFont,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }
    } finally {
      isLoading(false);
    }
  }
  getTimeString() {
    String dateFormat = DateFormat("yyyy-MM-dd/HH:mm:ss").format(DateTime.now());
    date.value = dateFormat;
  }
  updateWeightReport(WeightEntity weightModel,GlobalKey<FormState> key) async {
    getTimeString();
   if(key.currentState!.validate()){
     isLoading(true);
     WeightEntity weightEntity = WeightModel(
       weight: weight.value,
       weightId: weightModel.weightId,
       date: date.value,
       userId: weightModel.userId,
     );
     final result = await UpdateWeightReportUseCase.instance
         .call(weightEntity,FireWeightRepositoryImp.instance);
     if (result[mapKey].toString().toLowerCase() == "success") {
       Get.offAll(()=> const HomePage());
     } else {
       isLoading(false);
       return Get.snackbar(
         "update weight reports Exception",
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
           "update weight reports Exception",
           style: TextStyle(
             fontSize: 20,
             fontFamily: appFont,
             color: Colors.black,
             fontWeight: FontWeight.bold,
           ),
         ),
       );
     }
   }
  }
  deleteWeightReport(String weightId) async {
    isLoading(true);
    final result = await DeleteWeightReportUseCase.instance
        .call(weightId,FireWeightRepositoryImp.instance);
    if (result[mapKey].toString().toLowerCase() == "success") {
      Get.offAll(()=> const HomePage());
    } else {
      isLoading(false);
      return Get.snackbar(
        "update weight reports Exception",
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
          "update weight reports Exception",
          style: TextStyle(
            fontSize: 20,
            fontFamily: appFont,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

// @override
// void onInit() {
//   weightReportsList.clear();
//   getAllWeightReports();
//   super.onInit();
// }
// @override
// void dispose() {
//   HomeController.instance.dispose();
//   super.dispose();
// }
}
