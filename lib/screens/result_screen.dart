import 'package:flutter/material.dart';
import '../components/custom_elevated_button.dart';
import '../constants.dart';
import 'home_screen.dart';
import '../components/gradient_background.dart';

class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  ResultScreen({required this.height, required this.weight});

  @override
  Widget build(BuildContext context) {
    final double bmi = _calculateBMI(height, weight);
    final String result = _getBMIResult(bmi);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: theme.textTheme.displayMedium,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: GradientBackground(
        child: Center(
          child: Padding(
            padding: screenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your BMI is:',
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                Container(
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    //color: kColorLightText,
                    shape: BoxShape.circle,
                    boxShadow: kDropShadow,
                    border: Border.all(
                      color: kColorDarkGreen,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      bmi.toStringAsFixed(1),
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  result.toUpperCase(),
                  style: theme.textTheme.labelMedium,
                ),
                SizedBox(height: 32),
                Text(
                  'Healthy BMI range is:',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  '18.5 kg/m\u00b2 - 25 kg/m\u00b2',
                  style: theme.textTheme.labelMedium,
                ),
                SizedBox(height: 48),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  text: 'Re-Calculate',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _calculateBMI(double height, double weight) {
    if (height <= 0 || weight <= 0) {
      return 0; // or handle error appropriately
    }
    return weight / ((height / 100) * (height / 100));
  }

  String _getBMIResult(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
