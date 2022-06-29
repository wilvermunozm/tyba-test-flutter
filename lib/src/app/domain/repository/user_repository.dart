import '../models/user_model.dart';

abstract class UserRepository {
  Future<UserModel?> loginUser({required String userName, required String password});
}
