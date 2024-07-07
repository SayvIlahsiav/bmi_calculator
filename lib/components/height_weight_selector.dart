import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class HeightWeightSelector extends StatefulWidget {
  final int initialHWValue;
  final ValueChanged<int> onHWValueChanged;

  HeightWeightSelector({required this.initialHWValue, required this.onHWValueChanged});

  @override
  State<HeightWeightSelector> createState() => _HeightWeightSelectorState();
}

class _HeightWeightSelectorState extends State<HeightWeightSelector> {
  late int hw_value;
  final ScrollController _scrollController = ScrollController();
  final double itemHeight = 64.0;

  @override
  void initState() {
    super.initState();
    hw_value = widget.initialHWValue;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToValue(hw_value, animate: false);
    });
  }

  void jumpToPosition(int hw_value) {
    // Log screen width
    double screenHeight = MediaQuery.of(context).size.height;
    double centerPosition = screenHeight / 2;
    double targetPosition = calculateTargetPosition(hw_value, screenHeight);

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

    log('Screen Width: $screenHeight');
    log('Target Position for value $hw_value: $targetPosition');
    log('Center Position: $centerPosition');

    // Perform the jump
    _scrollController.jumpTo(targetPosition);
    log('Jumped to position: $targetPosition');
  }

  double calculateTargetPosition(int hw_value, double screenHeight) {
    double hwPosition = hw_value * itemHeight; // Assume each age is 32 pixels apart
    return hwPosition - (screenHeight / 2);
  }

  double calculateMaxScrollExtent() {
    // Calculate the maximum scroll extent
    // Assuming the total number of values is 100 for example
    int totalValues = 201;
    double maxScrollExtent = (totalValues - 1) * itemHeight;
    return maxScrollExtent;
  }

  void _scrollToValue(int hw_value, {bool animate = true}) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double targetPosition = (hw_value - 10) * itemHeight - (screenHeight / 2 - itemHeight / 2);

    print('Screen Height: $screenHeight');
    print('Target Position for hw_value $hw_value: $targetPosition');

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

  void _incrementValue() {
    if (hw_value < 240) {
      setState(() {
        hw_value++;
      });
      _scrollToValue(hw_value);
      widget.onHWValueChanged(hw_value);
    }
  }

  void _decrementValue() {
    if (hw_value > 40) {
      setState(() {
        hw_value--;
      });
      _scrollToValue(hw_value);
      widget.onHWValueChanged(hw_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: itemHeight * 2,
      height: screenHeight * 0.65,
      child: Column(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_drop_up, size: 32, color: kColorDarkText),
            onPressed: _decrementValue,
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification) {
                  double centerPosition = _scrollController.position.pixels + (screenHeight / 2 - itemHeight / 2);
                  int newValue = ((centerPosition / itemHeight) + 10).round();
                  print('Center Position: $centerPosition');
                  print('New Value: $newValue');
                  if (newValue != hw_value) {
                    setState(() {
                      hw_value = newValue;
                      widget.onHWValueChanged(hw_value);
                    });
                  }
                }
                return false;
              },
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                itemCount: 201, // Value range from 40 to 140
                itemBuilder: (context, index) {
                  final displayValue = index + 40;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        hw_value = displayValue;
                      });
                      _scrollToValue(hw_value);
                      widget.onHWValueChanged(hw_value);
                    },
                    child: Container(
                      height: itemHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: hw_value == displayValue ? kInnerShadow : kDropShadow,
                        border: Border.all(
                          color: hw_value == displayValue ? kColorDarkText : kColorDarkGreen,
                          width: 1,
                        ),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        displayValue.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: hw_value == displayValue ? kColorLightText : kColorDarkGreen,
                          fontWeight: hw_value == displayValue ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_drop_down, size: 32, color: kColorDarkText),
            onPressed: _incrementValue,
          ),
        ],
      ),
    );
  }
}
