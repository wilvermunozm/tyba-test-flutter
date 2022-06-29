import 'package:flutter/material.dart';

import '../utils/color_constants.dart';

class LoadingSwitcherWidget extends StatelessWidget {
  const LoadingSwitcherWidget({
    Key? key,
    required this.conditionToShowLoading,
    required this.child,
    this.indicator = false,
  }) : super(key: key);
  final bool conditionToShowLoading;
  final Widget child;
  final bool indicator;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: conditionToShowLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: kColorPrimary,
              ),
            )
          : child,
    );
  }
}
