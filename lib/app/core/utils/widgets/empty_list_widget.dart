import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weight_tracker_task/app/config/screen_handler.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        Container(
          child: Image(
            image: AssetImage(
              emptyItems,
            ),
            width: double.maxFinite,
            height: ScreenHandler.getScreenHeight(context) / 3,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "No Items here",
          style: TextStyle(
            fontSize: 16,
            fontFamily: appFont,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
