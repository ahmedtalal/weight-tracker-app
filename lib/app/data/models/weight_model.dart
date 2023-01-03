import 'package:uuid/uuid.dart';
import 'package:weight_tracker_task/app/domain/entities/weight_entity.dart';

class WeightModel extends WeightEntity{
  WeightModel({
    super.weight,
    super.date,
    super.weightId,
    super.userId,
});

  factory WeightModel.fromJson(Map<String, dynamic> data) {
    return WeightModel(
      weight: data["weight"],
      date: data["creationDate"],
      weightId: data["weightId"],
      userId: data["userId"],
    );
  }
  static Map<String, dynamic> toJson(WeightEntity model) {
    return {
      "weight": model.weight,
      "creationDate": model.date,
      "weightId":model.weightId,
      "userId":model.userId,
    };
  }


  static String generateUserId() {
    var uuid = const Uuid();
    return uuid.v1();
  }
}