import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: kTextAppName,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
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
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      child: Center(child: Text("Female"),),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Center(child: Text("Male")),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      child: Center(child: Text("Transgender")),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Center(child: Text("Agender")),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
