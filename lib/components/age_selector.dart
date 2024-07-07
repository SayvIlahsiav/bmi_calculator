import 'dart:developer';
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
  final ScrollController _scrollController = ScrollController();
  final double itemWidth = 64.0;

  @override
  void initState() {
    super.initState();
    age = widget.initialAge;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToAge(age, animate: false);
    });
  }

  void jumpToPosition(int age) {
    // Log screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double centerPosition = screenWidth / 2;
    double targetPosition = calculateTargetPosition(age, screenWidth);

    // Ensure target position does not go below 0
    if (targetPosition < 0) {
      targetPosition = 0;
      log('Adjusted Target Position to 0 to prevent scrolling out of bounds.');
    }

    // Ensure target position does not exceed maximum scroll extent
    double maxScrollExtent = calculateMaxScrollExtent();
    if (targetPosition > maxScrollExtent) {
      targetPosition = maxScrollExtent;
      log('Adjusted Target Position to $maxScrollExtent to prevent scrolling out of bounds.');
    }

    log('Screen Width: $screenWidth');
    log('Target Position for age $age: $targetPosition');
    log('Center Position: $centerPosition');

    // Perform the jump
    _scrollController.jumpTo(targetPosition);
    log('Jumped to position: $targetPosition');
  }

  double calculateTargetPosition(int age, double screenWidth) {
    double agePosition = age * 32.0; // Assume each age is 32 pixels apart
    return agePosition - (screenWidth / 2);
  }

  double calculateMaxScrollExtent() {
    // Calculate the maximum scroll extent
    // Assuming the total number of ages is 100 for example
    int totalAges = 100;
    double maxScrollExtent = (totalAges - 1) * 32.0;
    return maxScrollExtent;
  }


  void _scrollToAge(int age, {bool animate = true}) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double targetPosition = (age - 10) * itemWidth - (screenWidth / 2 - itemWidth / 2);

    print('Screen Width: $screenWidth');
    print('Target Position for age $age: $targetPosition');

    if (animate) {
      _scrollController.animateTo(
        targetPosition,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_) {
        print('Scrolled to position: ${_scrollController.position.pixels}');
      });
    } else {
      _scrollController.jumpTo(targetPosition);
      print('Jumped to position: ${_scrollController.position.pixels}');
    }
  }

  void _incrementAge() {
    if (age < 100) {
      setState(() {
        age++;
      });
      _scrollToAge(age);
      widget.onAgeChanged(age);
    }
  }

  void _decrementAge() {
    if (age > 10) {
      setState(() {
        age--;
      });
      _scrollToAge(age);
      widget.onAgeChanged(age);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: itemWidth,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left, size: 32, color: kColorDarkText),
                onPressed: _decrementAge,
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollEndNotification) {
                      double centerPosition = _scrollController.position.pixels + (screenWidth / 2 - itemWidth / 2);
                      int newAge = ((centerPosition / itemWidth) + 10).round();
                      print('Center Position: $centerPosition');
                      print('New Age: $newAge');
                      if (newAge != age) {
                        setState(() {
                          age = newAge;
                          widget.onAgeChanged(age);
                        });
                      }
                    }
                    return false;
                  },
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: 91, // Age range from 10 to 100
                    itemBuilder: (context, index) {
                      final displayAge = index + 10;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            age = displayAge;
                          });
                          _scrollToAge(age);
                          widget.onAgeChanged(age);
                        },
                        child: Container(
                          width: itemWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: age == displayAge ? kInnerShadow : kDropShadow,
                            border: Border.all(
                              color: age == displayAge ? kColorDarkText : kColorDarkGreen,
                              width: 1,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            displayAge.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: age == displayAge ? kColorLightText : kColorDarkGreen,
                              fontWeight: age == displayAge ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_right, size: 32, color: kColorDarkText),
                onPressed: _incrementAge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
