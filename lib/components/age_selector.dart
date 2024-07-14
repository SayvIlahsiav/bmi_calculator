import 'package:flutter/material.dart';
import '../constants.dart';

class AgeSelector extends StatefulWidget {
  final int initialAge;
  final ValueChanged<int> onAgeChanged;

  const AgeSelector({required this.initialAge, required this.onAgeChanged});

  @override
  _AgeSelectorState createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  late int age;
  final FixedExtentScrollController _scrollController = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    age = widget.initialAge;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToAge(age, animate: false);
    });
  }

  void _scrollToAge(int age, {bool animate = true}) {
    int ageIndex = age - kMinAge;
    if (animate) {
      _scrollController.animateToItem(
        ageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollController.jumpToItem(ageIndex);
    }
  }

  void _incrementAge() {
    if (age < kMaxAge) {
      setState(() {
        age++;
      });
      _scrollToAge(age);
      widget.onAgeChanged(age);
    }
  }

  void _decrementAge() {
    if (age > kMinAge) {
      setState(() {
        age--;
      });
      _scrollToAge(age);
      widget.onAgeChanged(age);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144, // Adjust height as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, size: 32, color: kColorDarkText),
            onPressed: _decrementAge,
          ),
          SizedBox(
            width: 160,
            child: ListWheelScrollView.useDelegate(
              diameterRatio: 4.0,
              controller: _scrollController,
              itemExtent: kItemSize,
              onSelectedItemChanged: (index) {
                int newAge = index + kMinAge;
                if (newAge != age) {
                  setState(() {
                    age = newAge;
                    widget.onAgeChanged(age);
                  });
                }
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  final displayAge = index + kMinAge;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        age = displayAge;
                      });
                      _scrollToAge(age);
                      widget.onAgeChanged(age);
                    },
                    child: Container(
                      width: 144,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: age == displayAge ? kInnerShadow : kDropShadow,
                        border: Border.all(
                          color: age == displayAge ? kColorDarkText : kColorDarkGreen,
                          width: 1,
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        "$displayAge years",
                        style: TextStyle(
                          fontSize: 20,
                          color: age == displayAge ? kColorLightText : kColorDarkGreen,
                          fontWeight: age == displayAge ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
                childCount: kMaxAge - kMinAge + 1,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, size: 32, color: kColorDarkText),
            onPressed: _incrementAge,
          ),
        ],
      ),
    );
  }
}
