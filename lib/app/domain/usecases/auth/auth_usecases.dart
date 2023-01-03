import 'package:weight_tracker_task/app/domain/repositories/i_auh_repository.dart';

class AnonymousAuthUseCase {
  static final AnonymousAuthUseCase _anonymousAuthUseCase =
      AnonymousAuthUseCase._internal();
  AnonymousAuthUseCase._internal();
  static AnonymousAuthUseCase get instance => _anonymousAuthUseCase;

  Future<Map<String, dynamic>> call(IAuthRepository iAuthRepository) async {
    return await iAuthRepository.anonymousAuth();
  }
}

class LogOutUseCase {
  static final LogOutUseCase _logOutUseCase = LogOutUseCase._internal();
  LogOutUseCase._internal();
  static LogOutUseCase get instance => _logOutUseCase;

  Future<Map<String, dynamic>> call(IAuthRepository iAuthRepository) async =>
      await iAuthRepository.logOutAuth();
}

class CheckIsAuthUseCase {
  static final CheckIsAuthUseCase _checkIsAuthUseCase =
      CheckIsAuthUseCase._internal();
  CheckIsAuthUseCase._internal();
  static CheckIsAuthUseCase get instance => _checkIsAuthUseCase;

  bool call(IAuthRepository iAuthRepository) => iAuthRepository.isUserLogin();
}
