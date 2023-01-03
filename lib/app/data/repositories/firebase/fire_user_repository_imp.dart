import 'package:weight_tracker_task/app/data/services/firebase/fire_user_service.dart';
import 'package:weight_tracker_task/app/domain/entities/user_entity.dart';
import 'package:weight_tracker_task/app/domain/repositories/i_user_repository.dart';

class FireUserRepositoryImp implements IUserRepository{
  static final FireUserRepositoryImp _fireUserRepository = FireUserRepositoryImp._internal();
  FireUserRepositoryImp._internal();
  static FireUserRepositoryImp get instance => _fireUserRepository;
  static final FireUserService _fireUserService = FireUserService.instance;
  @override
  Future<Map<String, dynamic>> addUser(UserEntity model) async{
    return await _fireUserService.fireAddUserInfo(model);
  }

}