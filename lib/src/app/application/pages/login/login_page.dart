import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tyba_test/src/app/application/pages/login/bloc/login_bloc.dart';
import 'package:tyba_test/src/app/application/pages/login/widgets/login_form.dart';

import '../../utils/app_navigator.dart';
import '../../widgets/animated_background_auth_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBackgroundAuthWidget(
      flex: 4,
      secondAction: () => goToRegisterPage(context: context),
      secondActionText: "Crear cuenta",
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('La autenticación ha fallado')),
              );
          }
          if (state.status.isSubmissionSuccess) {
            goToHomePage(context: context);
          }
        },
        child: const LoginForm(),
      ),
    );
  }
}
