import 'package:weight_tracker_task/app/data/services/firebase/fire_weight_service.dart';
import 'package:weight_tracker_task/app/domain/entities/weight_entity.dart';
import 'package:weight_tracker_task/app/domain/repositories/i_weight_repository.dart';

class FireWeightRepositoryImp implements IWeightRepository{
  static final FireWeightRepositoryImp _fireWeightRepositoryImp =
  FireWeightRepositoryImp._internal();
  FireWeightRepositoryImp._internal();
  static FireWeightRepositoryImp get instance =>
      _fireWeightRepositoryImp;
  @override
  Future<Map<String, dynamic>> addWeight(WeightEntity model) async{
    return await FireWeightServices.instance.fireAddWeightReport(model);
  }

  @override
  Future<Map<String, dynamic>> deleteWeight(String weightId) async{
    return await FireWeightServices.instance.fireDeleteWeightReport(weightId);
  }

  @override
  Future<Map<String, dynamic>> updateWeight(WeightEntity model) async{
    return await FireWeightServices.instance.fireUpdateWeightReport(model);
  }

  @override
  Future<Map<String, dynamic>> getAllWeight() async{
    return await FireWeightServices.instance.fireGetAllWeightReports();
  }

  @override
  Future<Map<String, dynamic>> getSpecialWeight(String weightId) async{
    return await FireWeightServices.instance.fireGetSpecialWeightReport(weightId);
  }

}