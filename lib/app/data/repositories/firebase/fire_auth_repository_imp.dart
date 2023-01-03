import 'package:weight_tracker_task/app/data/services/firebase/fire_auth_service.dart';
import 'package:weight_tracker_task/app/domain/repositories/i_auh_repository.dart';

class FireAuthRepositoryImp implements IAuthRepository {
  static final FireAuthRepositoryImp _fireAuthRepository =
      FireAuthRepositoryImp._internal();
  FireAuthRepositoryImp._internal();
  static FireAuthRepositoryImp get instance => _fireAuthRepository;

  @override
  Future<Map<String, dynamic>> anonymousAuth() async {
    return await FireAuthService.instance.fireAnonymousAuth();
  }

  @override
  bool isUserLogin() {
   return FireAuthService.instance.fireCheckIsAuth();
  }

  @override
  Future<Map<String, dynamic>> logOutAuth() async{
    return await FireAuthService.instance.fireLogOut();
  }
}
