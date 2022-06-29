import 'package:tyba_test/src/app/domain/models/user_model.dart';

class UserLocalDataSource {
  Future<UserModel> login({required String username, required String password}) async {
    return Future.value(
      username == "wilver"
          ? UserModel(
              name: "Wilver",
              email: "wilvermunozm@gmail.com",
              bio: "",
            )
          : null,
    );
  }
}
