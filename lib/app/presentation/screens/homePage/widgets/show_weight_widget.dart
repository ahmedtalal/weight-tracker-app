import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/custom_text_btn_widget.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/text_form_field_widget.dart';
import 'package:weight_tracker_task/app/domain/entities/weight_entity.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/config/screen_handler.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/home_page.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/logic/home__page_controller.dart';

class ShowWeightWidget extends StatelessWidget {
  const ShowWeightWidget({required this.weightEntity,Key? key}) : super(key: key);
  static final formKey = GlobalKey<FormState>();
final WeightEntity weightEntity ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding:  const EdgeInsets.all(12),
        color:  AppColorsUtil.color1,
        child: GetX<HomePageController>(
          init: HomePageController.instance,
          builder: (controller) {
            if(controller.isLoading.value){
              return const Center(child: CircularProgressIndicator(),);
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
                InkWell(
                  onTap: () {
                    controller.isLoading(true);
                    Get.offAll(()=> const HomePage());
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "date : ${weightEntity.date}",
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
                        initialValue: weightEntity.weight.toString(),
                      ),
                      SizedBox(height: ScreenHandler.getScreenHeight(context)/9),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextBtnWidget(
                              btnText: "Update Weight",
                              btnHeight: 60,
                              btnWidth: ScreenHandler.getScreenWidth(context)/1,
                              btnColor: AppColorsUtil.customeColor4,
                              btnBorderColor: AppColorsUtil.customeColor4,
                              raduis: 10,
                              onClick: (){
                                controller.updateWeightReport(weightEntity,formKey);
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                         Expanded(child:  CustomTextBtnWidget(
                           btnText: "Delete Weight",
                           btnHeight: 60,
                           btnWidth: ScreenHandler.getScreenWidth(context)/1,
                           btnColor: AppColorsUtil.customeColor4,
                           btnBorderColor: AppColorsUtil.customeColor4,
                           raduis: 10,
                           onClick: (){
                             controller.deleteWeightReport(weightEntity.weightId!);
                           },
                         ),),

                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
