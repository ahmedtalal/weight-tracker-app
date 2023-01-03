import 'package:weight_tracker_task/app/domain/entities/user_entity.dart';

abstract class IUserRepository{
  Future<Map<String,dynamic>> addUser(UserEntity model);
}