

import 'package:weight_tracker_task/app/domain/entities/weight_entity.dart';
import 'package:weight_tracker_task/app/domain/repositories/i_weight_repository.dart';

class AddWeighttUseCase {
  static final AddWeighttUseCase _addWeighttUseCase =
  AddWeighttUseCase._internal();
  AddWeighttUseCase._internal();
  static AddWeighttUseCase get instance => _addWeighttUseCase;

  Future<Map<String, dynamic>> call(WeightEntity weightEntity,
      IWeightRepository iWeightRepository) async =>
      await iWeightRepository.addWeight(weightEntity);
}

class GetAllIWeightReportsUseCase {
  static final GetAllIWeightReportsUseCase _allIWeightReportsUseCase =
  GetAllIWeightReportsUseCase._internal();
  GetAllIWeightReportsUseCase._internal();
  static GetAllIWeightReportsUseCase get instance => _allIWeightReportsUseCase;

  Future<Map<String, dynamic>> call(
      IWeightRepository iWeightRepository) async =>
      await iWeightRepository.getAllWeight();
}

class GetSpecialWeightReportUseCase {
  static final GetSpecialWeightReportUseCase _getSpecialWeightReportUseCase =
  GetSpecialWeightReportUseCase._internal();
  GetSpecialWeightReportUseCase._internal();
  static GetSpecialWeightReportUseCase get instance => _getSpecialWeightReportUseCase;

  Future<Map<String, dynamic>> call(
      String weightId, IWeightRepository iWeightRepository) async =>
      await iWeightRepository.getSpecialWeight(weightId);
}

class UpdateWeightReportUseCase {
  static final UpdateWeightReportUseCase _updateWeightReportUseCase =
  UpdateWeightReportUseCase._internal();
  UpdateWeightReportUseCase._internal();
  static UpdateWeightReportUseCase get instance => _updateWeightReportUseCase;

  Future<Map<String, dynamic>> call(
      WeightEntity weightEntity, IWeightRepository iWeightRepository) async =>
      await iWeightRepository.updateWeight(weightEntity);
}

class DeleteWeightReportUseCase {
  static final DeleteWeightReportUseCase _deleteWeightReportUseCase =
  DeleteWeightReportUseCase._internal();
  DeleteWeightReportUseCase._internal();
  static DeleteWeightReportUseCase get instance => _deleteWeightReportUseCase;

  Future<Map<String, dynamic>> call(
      String weightId, IWeightRepository iWeightRepository) async =>
      await iWeightRepository.deleteWeight(weightId);
}