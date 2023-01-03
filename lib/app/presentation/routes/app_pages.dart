import 'package:get/get.dart';
import 'package:weight_tracker_task/app/presentation/routes/app_routes.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/home_page.dart';
import 'package:weight_tracker_task/app/presentation/screens/registerScreen/register_screen.dart';
import 'package:weight_tracker_task/app/presentation/screens/splashScreen/logic/getx/splash_screen_binding.dart';
import 'package:weight_tracker_task/app/presentation/screens/splashscreen/splash_screen.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreenRoute,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.registerScreenRoute,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreenRoute,
      page: () => const HomePage(),
    ),
  ];
}
