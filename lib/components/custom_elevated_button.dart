import 'package:flutter/material.dart';
import '../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CustomElevatedButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          // Drop shadow
          BoxShadow(
            color: kColorDarkText,
            offset: Offset(1, 1),
            blurRadius: 4,
            spreadRadius: 1,
          ),
          // Inner shadow
          BoxShadow(
            color: kColorLightText,
            offset: Offset(-1, -1),
            blurRadius: 4,
            spreadRadius: -2,
          ),
        ],
        border: Border.all(
          color: kColorDarkText,
          width: 0.25,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: kColorLightText,
          backgroundColor: kColorDarkGreen,
          textStyle: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          minimumSize: Size(256, 64), // Custom dimensions
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
          ),
          shadowColor: kColorDarkText, // Remove the default shadow
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
