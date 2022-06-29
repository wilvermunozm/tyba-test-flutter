import 'package:tyba_test/src/app/domain/models/user_model.dart';

class UserLocalDataSource {
  Future<UserModel> login() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(
      UserModel(
        name: "Wilver",
        email: "wilvermunozm@gmail.com",
        bio: "",
      ),
    );
  }
}
