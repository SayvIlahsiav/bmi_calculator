import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'app_theme.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: HomeScreen(),
    );
  }
}
