import 'package:flutter/material.dart';

import 'color_constants.dart';
import 'dimension_constants.dart';

getTheme() => ThemeData(
      splashColor: kColorTransparent,
      highlightColor: kColorTransparent,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kDimens30),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(kDimens15),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(kColorBlack),
          foregroundColor: MaterialStateProperty.all<Color>(kColorWhite),
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: kDimens20)),
        ),
      ),
    );
