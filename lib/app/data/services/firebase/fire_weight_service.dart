// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weight_tracker_task/app/core/utils/strings.dart';
import 'package:weight_tracker_task/app/data/models/weight_model.dart';
import 'package:weight_tracker_task/app/domain/entities/weight_entity.dart';

class FireWeightServices {
  static final FireWeightServices _fireItemReportServices =
  FireWeightServices._internal();
  FireWeightServices._internal();
  static FireWeightServices get instance => _fireItemReportServices;

  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static final CollectionReference _collRef =
  _fireStore.collection("WeightsReport");

  Future<Map<String, dynamic>> fireAddWeightReport(
      WeightEntity weightEntity) async {
    try {
      DocumentReference docRef = _collRef.doc(weightEntity.weightId);
      Map<String, dynamic> data = WeightModel.toJson(weightEntity);
      await docRef.set(data);
      return successRequest(responseBody: true);
    } catch (e) {
      print("the add weight report error is :$e");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireGetSpecialWeightReport(String weightId) async {
    try {
      DocumentSnapshot docSnap = await _collRef.doc(weightId).get();
      dynamic data = docSnap.data();
      WeightEntity weightEntity = WeightModel.fromJson(data);
      return successRequest(responseBody: weightId);
    } catch (e) {
      print("the get special weight error is :${e.toString()}");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String, dynamic>> fireGetAllWeightReports() async {
    try {
      List<WeightEntity> weightList = [];
      QuerySnapshot querySnap = await _collRef.get();
      print("the item list is ${querySnap.docs.length}");
      for (QueryDocumentSnapshot element in querySnap.docs) {
        dynamic data = element.data();
        weightList.add(WeightModel.fromJson(data));
      }
      return successRequest(responseBody: weightList);
    } catch (e) {
      print('the get all weights error is :${e.toString()}');
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String,dynamic>> fireUpdateWeightReport(WeightEntity weightEntity)async{
    try {
      DocumentReference docRef = _collRef.doc(weightEntity.weightId);
      Map<String, dynamic> data = WeightModel.toJson(weightEntity);
      await docRef.update(data);
      return successRequest(responseBody: true);
    } catch (e) {
      print("the update weight report error is :$e");
      return failedRequest(responseBody: e.toString());
    }
  }

  Future<Map<String,dynamic>> fireDeleteWeightReport(String weightId) async{
    try {
      DocumentReference docRef = _collRef.doc(weightId);
      await docRef.delete();
      return successRequest(responseBody: true);
    } catch (e) {
      print("the delete weight report error is :$e");
      return failedRequest(responseBody: e.toString());
    }
  }
}
