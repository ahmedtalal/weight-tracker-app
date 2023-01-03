import 'package:weight_tracker_task/app/domain/entities/weight_entity.dart';

abstract class IWeightRepository{

  Future<Map<String,dynamic>> addWeight(WeightEntity model);
  Future<Map<String,dynamic>> deleteWeight(String weightId);
  Future<Map<String,dynamic>> updateWeight(WeightEntity model);
  Future<Map<String,dynamic>> getAllWeight();
  Future<Map<String,dynamic>> getSpecialWeight(String weightId);
}