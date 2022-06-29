import 'package:tyba_test/src/app/data/data_source/user_local_data_source.dart';
import 'package:tyba_test/src/app/domain/models/user_model.dart';
import 'package:tyba_test/src/app/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _localDataSource;

  UserRepositoryImpl({required UserLocalDataSource localDataSource}) : _localDataSource = localDataSource;

  @override
  Future<UserModel?> loginUser({required String userName, required String password}) {
    return _localDataSource.login();
  }
}
