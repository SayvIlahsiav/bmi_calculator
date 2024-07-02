import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: SplashScreen(),
    );
  }
}
