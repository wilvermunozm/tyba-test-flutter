import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tyba_test/src/app/application/utils/core_constants.dart';

import '../utils/color_constants.dart';
import '../utils/dimension_constants.dart';
import 'app_logo.dart';
import 'generic_button_widget.dart';

class AnimatedBackgroundAuthWidget extends StatefulWidget {
  final Widget child;
  final int flex;
  final VoidCallback secondAction;
  final String secondActionText;

  const AnimatedBackgroundAuthWidget({
    required this.child,
    required this.flex,
    required this.secondAction,
    required this.secondActionText,
    Key? key,
  });

  @override
  _AnimatedBackgroundAuthWidgetState createState() => _AnimatedBackgroundAuthWidgetState();
}

class _AnimatedBackgroundAuthWidgetState extends State<AnimatedBackgroundAuthWidget> with TickerProviderStateMixin {
  AnimationController? controller1;
  AnimationController? controller2;
  Animation<double>? animation1;
  Animation<double>? animation2;
  Animation<double>? animation3;
  Animation<double>? animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1!,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1?.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1?.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1!,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2!,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2?.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2?.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2!,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1?.forward();
    });

    controller2?.forward();
  }

  @override
  void dispose() {
    controller1?.dispose();
    controller2?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorWhite,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Positioned(
                  top: size.height * (animation2?.value ?? 0 + .58),
                  left: size.width * .21,
                  child: CustomPaint(
                    painter: MyPainter(50),
                  ),
                ),
                Positioned(
                  top: size.height * .98,
                  left: size.width * .1,
                  child: CustomPaint(
                    painter: MyPainter(animation4?.value ?? 0 - 30),
                  ),
                ),
                Positioned(
                  top: size.height * .5,
                  left: size.width * (animation2?.value ?? 0 + .8),
                  child: CustomPaint(
                    painter: MyPainter(30),
                  ),
                ),
                Positioned(
                  top: size.height * (animation3?.value ?? 0),
                  left: size.width * (animation1?.value ?? 0 + .1),
                  child: CustomPaint(
                    painter: MyPainter(60),
                  ),
                ),
                Positioned(
                  top: size.height * .1,
                  left: size.width * .8,
                  child: CustomPaint(
                    painter: MyPainter(animation4?.value ?? 0),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(top: size.height * .1),
                        child: const Text(
                          kMainCompanyName,
                          style: TextStyle(
                            color: kColorWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            wordSpacing: 4,
                          ),
                        ),
                      ),
                    ),
                    const AppLogo(width: kDimens100),
                    Expanded(
                      flex: widget.flex,
                      child: widget.child,
                    ),
                    /*Expanded(
                      child: Row(
                        children: [
                          AppLogo(width: kDimens50),
                        ],
                      ),
                    ),*/
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GenericButtonWidget(
                            text: widget.secondActionText,
                            width: 2,
                            voidCallback: widget.secondAction,
                          ),
                          SizedBox(height: size.height * .05),
                        ],
                      ),
                    ),
                    const SizedBox(height: kDimens5),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [kColorBlack, kColorPrimary.withOpacity(.5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
