import 'package:flutter/material.dart';
import 'package:tyba_test/src/app/application/pages/register/widgets/register_form.dart';

import '../../utils/app_navigator.dart';
import '../../widgets/animated_background_auth_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundAuthWidget(
      flex: 7,
      secondAction: () => goToLoginPage(),
      secondActionText: "Ya tengo una cuenta",
      child: RegisterForm(
        errors: [],
        mainAction: () {
          print("hola");
        },
      ),
    );
  }
}
