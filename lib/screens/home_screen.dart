import 'package:bmi_calculator/components/custom_elevated_button.dart';
import 'package:bmi_calculator/components/gradient_background.dart';
import 'package:bmi_calculator/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/gender_selector.dart';
import '../components/age_selector.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedGender;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: Icon(Icons.calculate_rounded, size: 32,),
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
              Text(
                'Gender',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 24),
              GenderSelector(
                selectedGender: selectedGender,
                onGenderSelected: (gender) {
                  setState(() {
                    selectedGender = gender;
                  });
                },
              ),
              SizedBox(height: 32),
              Text(
                'Age',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 16),
              AgeSelector(
                initialAge: age,
                onAgeChanged: (newAge) {
                  setState(() {
                    age = newAge;
                  });
                },
              ),
              SizedBox(height: 48),
              CustomElevatedButton (
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                },
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
