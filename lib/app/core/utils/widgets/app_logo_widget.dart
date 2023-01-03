import 'package:flutter/material.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/config/screen_handler.dart';
class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenHandler.setWidthSpacing(widthSpacing: 0.6, context: context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           Text(
            "Hello \nThere",
            style: TextStyle(
              fontSize: ScreenHandler.getScreenHeight(context)/14,
              fontWeight: FontWeight.bold,
              height: 0.9,
              color: Colors.white,
              fontFamily: appFont,
            ),
          ),
          Container(
            width: 11,
            height: 11,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 3, bottom: 8),
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColorsUtil.customeColor4,
            ),
          ),
        ],
      ),
    );
  }
}
