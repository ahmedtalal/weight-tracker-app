import 'package:weight_tracker_task/app/domain/entities/user_entity.dart';
import 'package:uuid/uuid.dart';

class UserModel extends UserEntity {
  UserModel({
    super.userId,
    super.creationDate
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      userId: data["userId"],
      creationDate: data["creationDate"],
    );
  }
  static Map<String, dynamic> toJson(UserEntity model) {
    return {
      "userId": model.userId,
      "creationDate": model.creationDate,
    };
  }


  static String generateUserId() {
    var uuid = const Uuid();
    return uuid.v1();
  }
}