import 'package:bmi_calculator/components/gradient_background.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

import '../components/custom_elevated_button.dart';
import '../components/height_weight_selector.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int height = 150;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: theme.textTheme.displayMedium,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GradientBackground(
        child: Padding(
          padding: kScreenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLabel('Height', '(in cm)'),
                  _buildLabel('Weight', '(in kg)'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HeightWeightSelector(
                    initialHWValue: height,
                    onHWValueChanged: (newHeight) {
                      setState(() {
                        height = newHeight;
                      });
                    },
                  ),
                  HeightWeightSelector(
                    initialHWValue: weight,
                    onHWValueChanged: (newWeight) {
                      setState(() {
                        weight = newWeight;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                onPressed: () {
                  if (height > 0 && weight > 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          height: height.toDouble(),
                          weight: weight.toDouble(),
                        ),
                      ),
                    );
                  } else {
                    // Show an error message if height or weight is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please enter valid height and weight.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }
                },
                text: 'Calculate',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A helper method for creating text labels
  Widget _buildLabel(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
