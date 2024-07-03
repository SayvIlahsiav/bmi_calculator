import 'package:flutter/material.dart';
import '../constants.dart';

class AgeSelector extends StatefulWidget {
  final int initialAge;
  final ValueChanged<int> onAgeChanged;

  AgeSelector({required this.initialAge, required this.onAgeChanged});

  @override
  _AgeSelectorState createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  late int age;

  @override
  void initState() {
    super.initState();
    age = widget.initialAge;
  }

  void _incrementAge() {
    setState(() {
      age++;
    });
    widget.onAgeChanged(age);
  }

  void _decrementAge() {
    setState(() {
      age--;
    });
    widget.onAgeChanged(age);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          // Drop shadow
          BoxShadow(
            color: kColorDarkText,
            blurRadius: 4,
            spreadRadius: 0.25,
            offset: Offset(0, 0.25),
          ),
          BoxShadow(color: kColorLightText),
          // Inner shadow
          BoxShadow(color: kColorLightGreen),
          BoxShadow(
            color: kColorLightText,
            blurRadius: 20,
            spreadRadius: -0.25,
            offset: Offset(0, 1),
          ),
        ],
        border: Border.all(
          color: kColorDarkGreen,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_left, size: 32, color: kColorDarkText),
            onPressed: _decrementAge,
          ),
          Text(
            age.toString(),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: kColorDarkText,
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right, size: 32, color: kColorDarkText),
            onPressed: _incrementAge,
          ),
        ],
      ),
    );
  }
}
