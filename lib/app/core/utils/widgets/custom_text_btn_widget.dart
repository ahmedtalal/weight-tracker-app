import 'package:flutter/material.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';

class CustomTextBtnWidget extends StatelessWidget {
  const CustomTextBtnWidget({
    required this.btnText,
    required this.btnHeight,
    required this.btnWidth,
    required this.btnBorderColor,
    required this.btnColor,
    required this.raduis,
    required this.onClick,
    Key? key,
  }) : super(key: key);
  final double btnHeight, btnWidth, raduis;
  final Color btnBorderColor, btnColor;
  final String btnText;
  final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: btnHeight,
        width: btnWidth,
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(raduis),
          border: Border.all(color: btnBorderColor, width: 0.6),
          color: btnColor,
        ),
        child: Text(
          btnText,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: appFont,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
