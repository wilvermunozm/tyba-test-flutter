import 'package:flutter/material.dart';
import 'package:tyba_test/src/app/application/utils/routes/routes.dart';

void goToRegisterPage({required BuildContext context}) => Navigator.of(context).pushNamed(AppRoutes.REGISTER_PAGE);

void goToLoginPage({required BuildContext context}) => Navigator.of(context).pushNamed(AppRoutes.LOGIN_PAGE);

void goToHomePage({required BuildContext context}) => Navigator.of(context).pushNamed(AppRoutes.HOME_PAGE);
