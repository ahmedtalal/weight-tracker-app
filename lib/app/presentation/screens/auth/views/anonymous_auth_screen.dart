import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_task/app/config/screen_handler.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/app_logo_widget.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/custom_text_btn_widget.dart';
import 'package:weight_tracker_task/app/presentation/screens/auth/logic/getx/auth_controller.dart';

class AnonymousAthScreen extends StatelessWidget {
  const AnonymousAthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        color: AppColorsUtil.color1,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 9),
            const AppLogoWidget(),
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 9),
            Center(
              child: Container(
                height: ScreenHandler.getScreenHeight(context) / 7,
                width: ScreenHandler.getScreenWidth(context) / 2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 4),
                ),
                child: const Image(
                  image: AssetImage(anonymous_person),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Anonymous User",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: appFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 9),
            Center(
              child: GetX<AuthController>(
                init: AuthController.instance,
                builder: (controller) {
                  if(controller.loading.value)
                    {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  return CustomTextBtnWidget(
                    btnText: "Register",
                    btnHeight: 60,
                    btnWidth: ScreenHandler.getScreenWidth(context)/1,
                    btnColor: AppColorsUtil.customeColor4,
                    btnBorderColor: AppColorsUtil.customeColor4,
                    raduis: 10,
                    onClick: (){
                      controller.onClickAnonymousBtn();
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
