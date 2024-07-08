import 'package:bmi_calculator/components/gradient_background.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import '../components/custom_elevated_button.dart';
import '../components/height_weight_selector.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int height = 150;
  int weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: GradientBackground(
          child: Padding(
            padding: screenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Height',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'Weight',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                SizedBox(height: 24),
                CustomElevatedButton (
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultScreen(height: height.toDouble(), weight: weight.toDouble()),),
                    );
                  },
                  text: 'Calculate',
                ),
              ],
            ),
          ),
        ),
    );
  }
}
