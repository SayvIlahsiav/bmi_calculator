import 'package:bmi_calculator/components/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/gender_selector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: kTextAppName,
        backgroundColor: Colors.transparent,
      ),
      body: GradientBackground(
        child: Container(
          child: SafeArea(
            child: Column(
              children: [
                GenderSelector(
                  selectedGender: selectedGender,
                  onGenderSelected: (gender) {
                    setState(() {
                      selectedGender = gender;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
