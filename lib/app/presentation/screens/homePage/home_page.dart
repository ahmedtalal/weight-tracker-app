import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_task/app/config/screen_handler.dart';
import 'package:weight_tracker_task/app/core/utils/app_colors.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/core/utils/widgets/empty_list_widget.dart';
import 'package:weight_tracker_task/app/presentation/screens/addweightscreen/add_weight_page.dart';
import 'package:weight_tracker_task/app/presentation/screens/auth/logic/getx/auth_controller.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/logic/home__page_controller.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/widgets/weight_view_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        padding: const EdgeInsets.all(12),
        color: AppColorsUtil.color1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Weight Tracker",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: appFont,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 3,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColorsUtil.customeColor4,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GetBuilder<AuthController>(
                      init: AuthController.instance,
                      builder: (authController) {
                        return InkWell(
                          onTap: () async{
                           await authController.onClickLogoutBtn();
                          },
                          child: const Icon(
                            Icons.logout,
                            size: 18,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.offAll(() => const AddWeightPage());
                      },
                      child: const Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: ScreenHandler.getScreenHeight(context) / 10),
            GetX<HomePageController>(
                init: HomePageController.instance,
                initState: (state) {
                  state.controller!.weightReportsList.clear();
                  state.controller!.getAllWeightReports();
                },
                builder: ((controller) {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.weightReportsList.isEmpty) {
                    return const EmptyListWidget();
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: controller.weightReportsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return WeightViewWidget(
                            weightEntity: controller.weightReportsList[index],
                          );
                        }),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
