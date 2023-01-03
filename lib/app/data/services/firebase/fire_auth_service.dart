// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/data/models/user_model.dart';
import 'package:weight_tracker_task/app/data/services/firebase/fire_user_service.dart';

class FireAuthService {
  static final FireAuthService _authService = FireAuthService._internal();
  FireAuthService._internal();
  static FireAuthService get instance => _authService;
  static final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  Future<Map<String, dynamic>> fireAnonymousAuth() async {
    try {
      UserCredential userCredential = await _fireAuth.signInAnonymously();
      UserModel userModel = UserModel(
        userId: userCredential.user!.uid,
        creationDate: userCredential.user!.metadata.creationTime,
      );
      return await FireUserService.instance.fireAddUserInfo(userModel);
    } on FirebaseException catch (e) {
       return failedRequest(responseBody: e.code);
    } catch (e) {
       return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String,dynamic>> fireLogOut() async{
    try {
      await _fireAuth.signOut();
      return successRequest(responseBody: true);
    } catch (e) {
      print("the logout error is ${e.toString()}");
      return failedRequest(responseBody: false);
    }
  }

  bool fireCheckIsAuth() {
    if (_fireAuth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }
}
