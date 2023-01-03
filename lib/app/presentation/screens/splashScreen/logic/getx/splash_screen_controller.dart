import 'package:get/get.dart';

class SplashScreenController extends GetxController{
  static final SplashScreenController _splashScreenController = SplashScreenController._internal();
  SplashScreenController._internal();
  static SplashScreenController get instance => _splashScreenController;
}