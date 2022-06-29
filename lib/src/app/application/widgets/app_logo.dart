import 'package:flutter/material.dart';

import '../utils/asset_constants.dart';

class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;

  AppLogo({
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      kLogo,
      width: width,
      height: height,
    );
  }
}
