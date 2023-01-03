import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/data/repositories/firebase/fire_auth_repository_imp.dart';
import 'package:weight_tracker_task/app/domain/usecases/auth/auth_usecases.dart';
import 'package:weight_tracker_task/app/presentation/routes/app_routes.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/home_page.dart';
import 'package:weight_tracker_task/app/presentation/screens/splashScreen/splash_screen.dart';

class AuthController extends GetxController {
  static final AuthController _authController = AuthController._internal();
  AuthController._internal();
  static AuthController get instance => _authController;
  final loading = false.obs;

  onClickAnonymousBtn() async {
    _isLoading(true);
    final result = await AnonymousAuthUseCase.instance
        .call(FireAuthRepositoryImp.instance);
    if (result[mapKey].toString().toLowerCase() == "success") {
      Get.offAll(() => const HomePage());
    } else {
      _isLoading(false);
      return Get.snackbar(
        "anonymous auth Exception",
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
          "anonymous auth Exception",
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

  _isLoading(bool value) {
    loading.value = value;
  }

  onClickLogoutBtn() async {
    _isLoading(false);
    final result =
        await LogOutUseCase.instance.call(FireAuthRepositoryImp.instance);
    if (result[mapKey].toString().toLowerCase() == "success") {
      Get.offAll(() => const SplashScreen());
    }
  }

  onClickUserIsLogin() {
    return CheckIsAuthUseCase.instance.call(FireAuthRepositoryImp.instance)
        ? AppRoutes.homeScreenRoute
        : AppRoutes.splashScreenRoute;
  }
}
