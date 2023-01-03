abstract class IAuthRepository{
  Future<Map<String,dynamic>> anonymousAuth();
  Future<Map<String,dynamic>> logOutAuth();
  bool isUserLogin();
}