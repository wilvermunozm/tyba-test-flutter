import 'package:tyba_test/src/app/domain/models/user_model.dart';

import '../repository/user_repository.dart';

class LoginUserUseCase {
  final UserRepository _userRepository;

  LoginUserUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<UserModel?> invoke({required String userName, required String password}) {
    return _userRepository.loginUser(userName: userName, password: password);
  }
}
