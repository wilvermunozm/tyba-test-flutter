import 'package:flutter/material.dart';

import '../utils/color_constants.dart';
import '../utils/dimension_constants.dart';

class GenericButtonWidget extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback voidCallback;

  const GenericButtonWidget({
    required this.text,
    required this.width,
    required this.voidCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonComponent(context: context);
  }

  Widget buttonComponent({required BuildContext context}) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(kDimens15),
      child: InkWell(
        highlightColor: kColorPrimary,
        splashColor: kColorPrimary,
        onTap: voidCallback,
        child: Container(
          height: size.width / 8,
          width: size.width / width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: kColorPrimary.withOpacity(.8),
            borderRadius: BorderRadius.circular(kDimens15),
            border: Border.all(color: kColorBlack),
          ),
          child: Text(
            text,
            style: const TextStyle(color: kColorWhite),
          ),
        ),
      ),
    );
  }
}
