import 'package:flutter/material.dart';
import 'package:weight_tracker_task/app/domain/entities/weight_entity.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:get/get.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/logic/home__page_controller.dart';
import 'package:weight_tracker_task/app/presentation/screens/homePage/widgets/show_weight_widget.dart';

class WeightViewWidget extends StatelessWidget {
  const WeightViewWidget({required this.weightEntity, super.key});
  final WeightEntity weightEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(() => ShowWeightWidget(weightEntity: weightEntity));
      },
      child: GetX<HomePageController>(
          init: HomePageController.instance,
          builder: (controller) {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            return Card(
              color: Colors.white,
              shadowColor: Colors.grey[200],
              elevation: 5,
              margin: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 5,
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      weightEntity.weight.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      weightEntity.date.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: appFont,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_right,
                      size: 30,
                      color: Colors.black,
                    ),
                  )),
            );
          }),
    );
  }
}
