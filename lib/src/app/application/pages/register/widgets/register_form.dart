import 'package:flutter/material.dart';

import '../../../../domain/enums/input_register_errors.dart';
import '../../../utils/color_constants.dart';
import '../../../widgets/generic_button_widget.dart';
import '../../../widgets/input_text_widget.dart';

class RegisterForm extends StatelessWidget {
  final List<InputRegisterErrors> errors;
  final VoidCallback mainAction;

  const RegisterForm({
    required this.errors,
    required this.mainAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kColorBlack.withOpacity(.8)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /* InputTextWidget(
            icon: Icons.account_circle_outlined,
            hintText: 'Nombre...',
            isEmail: false,
            isPassword: false,
            hasErrors: errors.contains(InputRegisterErrors.nameError),
          ),
          InputTextWidget(
            icon: Icons.account_circle_outlined,
            hintText: 'Correo...',
            isEmail: true,
            isPassword: false,
            hasErrors: errors.contains(InputRegisterErrors.emailError),
          ),
          InputTextWidget(
            icon: Icons.account_circle_outlined,
            hintText: 'Contraseña...',
            isEmail: false,
            isPassword: true,
            hasErrors: errors.contains(InputRegisterErrors.passwordError),
          ),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenericButtonWidget(
                text: "Crear cuenta",
                width: 2,
                voidCallback: mainAction,
              )
            ],
          ),
        ],
      ),
    );
  }
}
