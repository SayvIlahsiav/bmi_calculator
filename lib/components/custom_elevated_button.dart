import 'package:flutter/material.dart';

import '../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

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
          backgroundColor: Colors.white.withOpacity(0.09),
          textStyle: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          minimumSize: const Size(256, 64),
          // Custom dimensions
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Rounded corners
          ),
          shadowColor: kColorDarkText, // Custom shadow color
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
