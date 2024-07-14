import 'package:flutter/material.dart';

import '../constants.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            kColorLightBlue,
            kColorLightGreen,
            kColorLightYellow,
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
