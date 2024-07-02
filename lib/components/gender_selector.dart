import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onGenderSelected;

  GenderSelector({required this.selectedGender, required this.onGenderSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildGenderButton('Female', Icons.female),
            _buildGenderButton('Male', Icons.male),
          ],
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildGenderButton('Transgender', Icons.transgender),
            _buildGenderButton('Agender', Icons.do_not_disturb_on_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderButton(String gender, IconData icon) {
    final bool isSelected = gender == selectedGender;

    return GestureDetector(
      onTap: () => onGenderSelected(gender),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: isSelected ? [
                BoxShadow(color: kColorDarkText),
                BoxShadow(
                  color: kColorDarkGreen,
                  blurRadius: 8,
                  spreadRadius: -0.25,
                  offset: Offset(0, 1),
                )
              ] : [
                BoxShadow(
                  color: kColorDarkText,
                  blurRadius: 4,
                  spreadRadius: 0.25,
                  offset: Offset(0, 0.25),
                ),
                BoxShadow(color: kColorLightText)
              ],
              border: Border.all(
                color: isSelected ? kColorDarkText : kColorDarkGreen,
                width: 1,
              ),
            ),
            padding: EdgeInsets.all(32),
            height: 128,
            width: 128,
            child: Icon(
              icon,
              size: 64,
              color: kColorDarkText,
            ),
          ),
          SizedBox(height: 8),
          Text(
            gender.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? kColorDarkText : kColorDarkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
