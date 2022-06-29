import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tyba_test/src/app/application/widgets/loading_switcher_widget.dart';

import '../../../utils/color_constants.dart';
import '../../../widgets/generic_button_widget.dart';
import '../../../widgets/input_text_widget.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kColorBlack.withOpacity(.8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            return InputTextWidget(
              icon: Icons.account_circle_outlined,
              hintText: 'Correo...',
              isEmail: true,
              isPassword: false,
              hasErrors: state.username.invalid,
              onChange: (username) => context.read<LoginBloc>().add(LoginUsernameChanged(username ?? "")),
            );
          }),
          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            return InputTextWidget(
              icon: Icons.account_circle_outlined,
              hintText: 'Contraseña...',
              isEmail: false,
              isPassword: true,
              hasErrors: state.password.invalid,
              onChange: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password ?? "")),
            );
          }),
          LoadingSwitcherWidget(
            conditionToShowLoading: context.read<LoginBloc>().state.status.isSubmissionInProgress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenericButtonWidget(
                  text: "Iniciar Sesión",
                  width: 2,
                  voidCallback: () => context.read<LoginBloc>().add(const LoginSubmitted()),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
