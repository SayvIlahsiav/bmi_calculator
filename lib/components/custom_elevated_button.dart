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
        boxShadow: kDropShadowBtn,
        border: Border.all(
          color: kColorDarkText,
          width: 0.25,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: kColorLightText,
          backgroundColor: Colors.transparent,
          textStyle: const TextStyle(
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
