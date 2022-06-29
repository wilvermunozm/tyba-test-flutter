import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/color_constants.dart';
import '../utils/dimension_constants.dart';

class InputTextWidget extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final bool hasErrors;
  final TextEditingController? controller;
  final Function(String?) onChange;

  const InputTextWidget({
    required this.icon,
    required this.hintText,
    required this.isPassword,
    required this.isEmail,
    required this.hasErrors,
    required this.onChange,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return inputComponent(context: context);
  }

  Widget inputComponent({required BuildContext context}) {
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: (width / 8) + (hasErrors ? 30.0 : 0),
          width: width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: width / 30),
          decoration: BoxDecoration(
            color: kColorWhite.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            style: TextStyle(color: kColorWhite.withOpacity(.8)),
            cursorColor: kColorWhite,
            autocorrect: true,
            onChanged: onChange,
            controller: controller,
            obscureText: isPassword,
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: kColorWhite.withOpacity(.7),
              ),
              border: InputBorder.none,
              enabledBorder: hasErrors
                  ? const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kColorRed,
                        width: kDimens2,
                      ),
                    )
                  : InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              errorText: hasErrors ? 'Dato incorrecto' : null,
              hintStyle: TextStyle(fontSize: 14, color: kColorWhite.withOpacity(.5)),
            ),
          ),
        ),
      ),
    );
  }
}
