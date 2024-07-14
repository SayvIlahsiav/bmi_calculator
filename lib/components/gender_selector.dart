import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderSelector extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String> onGenderSelected;

  const GenderSelector({
    Key? key,
    required this.selectedGender,
    required this.onGenderSelected,
  }) : super(key: key);

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
        const SizedBox(height: 24),
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
              boxShadow: isSelected ? kInnerShadow : kDropShadow,
              border: Border.all(
                color: isSelected ? kColorDarkText : kColorDarkGreen,
                width: 1,
              ),
            ),
            height: 128,
            width: 128,
            child: Icon(
              icon,
              size: 64,
              color: kColorDarkText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            gender.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? kColorDarkText : kColorDarkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
