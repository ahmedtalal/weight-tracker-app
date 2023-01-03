import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_task/app/config/screen_handler.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/custom_text_btn_widget.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/text_form_field_widget.dart';
import 'package:weight_tracker_task/app/presentation/screens/addweightscreen/logic/getx/add_weight_controller.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/home_page.dart';

class AddWeightPage extends StatelessWidget {
  const AddWeightPage({Key? key}) : super(key: key);
  static final formKey = GlobalKey<FormState>();
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
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.offAll(()=>const HomePage());
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Add Weight",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: appFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
             SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
            GetX<AddWeightController>(
              init: AddWeightController.instance,
              initState: (state){
                state.controller!.getTimeString();
              },
              builder: (controller) {
                if(controller.isLoadingIcon.value){
                  return const Center(child: CircularProgressIndicator(),);
                }
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                       Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "date : ${controller.date.value}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: appFont,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        label: "Weight",
                        hint: "add weight",
                        textType: TextInputType.text,
                        prefIcon: Icons.add,
                        onChangeListenser: (String? newValue) {
                          controller.onChangeWeight(newValue);
                        },
                        onValidateListenser: (String? value) {
                          return controller.onValidateField(value!);
                        },
                        initialValue: "",
                      ),
                      SizedBox(height: ScreenHandler.getScreenHeight(context)/9),
                      CustomTextBtnWidget(
                        btnText: "Add Weight",
                        btnHeight: 60,
                        btnWidth: ScreenHandler.getScreenWidth(context)/1,
                        btnColor: AppColorsUtil.customeColor4,
                        btnBorderColor: AppColorsUtil.customeColor4,
                        raduis: 10,
                        onClick: (){
                          controller.onClickConfirmWeightReport(formKey);
                        },
                      )
                    ],
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
