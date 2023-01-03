// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/data/models/user_model.dart';
import 'package:weight_tracker_task/app/domain/entities/user_entity.dart';

class FireUserService {
  static final FireUserService _userService = FireUserService._internal();
  FireUserService._internal();
  static FireUserService get instance => _userService;
  static final CollectionReference _collRef =
      FirebaseFirestore.instance.collection("Users");

  Future<Map<String,dynamic>> fireAddUserInfo(UserEntity userEntity) async{
    try {
      DocumentReference docRef = _collRef.doc(userEntity.userId);
      Map<String, dynamic> data = UserModel.toJson(userEntity);
      await docRef.set(data);
      return successRequest(responseBody: true);
    } catch (e) {
      print("the add user error is :$e");
      return failedRequest(responseBody: e.toString());
    }
  }
}
