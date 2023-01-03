import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/config/screen_handler.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/app_logo_widget.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/custom_text_btn_widget.dart';
import 'package:weight_tracker_task/app/presentation/screens/auth/views/anonymous_auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.all(12),
      color: AppColorsUtil.color1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenHandler.getScreenHeight(context) / 7),
          const AppLogoWidget(),
          SizedBox(height: ScreenHandler.getScreenHeight(context) / 8),
          const Center(
            child: Text(
              "Weight Tracker App",
              style: TextStyle(
                fontSize: 30,
                fontFamily: appFont,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: ScreenHandler.getScreenHeight(context) / 6),
          Center(
            child: CustomTextBtnWidget(
              btnText: "Get Started",
              btnHeight: ScreenHandler.getScreenHeight(context)/13,
              btnWidth: double.maxFinite,
              btnBorderColor: AppColorsUtil.customeColor4,
              btnColor: AppColorsUtil.customeColor4,
              raduis: 12,
              onClick: (){
                Get.offAll(()=> const AnonymousAthScreen());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
