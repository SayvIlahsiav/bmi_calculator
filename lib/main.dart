import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
