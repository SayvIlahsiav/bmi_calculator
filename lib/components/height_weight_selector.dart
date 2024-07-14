import 'package:flutter/material.dart';

import '../constants.dart';

class HeightWeightSelector extends StatefulWidget {
  final int initialHWValue;
  final ValueChanged<int> onHWValueChanged;

  const HeightWeightSelector(
      {Key? key, required this.initialHWValue, required this.onHWValueChanged})
      : super(key: key);

  @override
  State<HeightWeightSelector> createState() => _HeightWeightSelectorState();
}

class _HeightWeightSelectorState extends State<HeightWeightSelector> {
  late int hwValue;
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    hwValue = widget.initialHWValue;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToValue(hwValue, animate: false);
    });
  }

  void _scrollToValue(int hwValue, {bool animate = true}) {
    final int valueIndex = hwValue - kMinHWValue;
    if (animate) {
      _scrollController.animateToItem(
        valueIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _scrollController.jumpToItem(valueIndex);
    }
  }

  void _incrementValue() {
    if (hwValue < kMaxHWValue) {
      setState(() {
        hwValue++;
      });
      _scrollToValue(hwValue);
      widget.onHWValueChanged(hwValue);
    }
  }

  void _decrementValue() {
    if (hwValue > kMinHWValue) {
      setState(() {
        hwValue--;
      });
      _scrollToValue(hwValue);
      widget.onHWValueChanged(hwValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: kItemSize * 2,
      height: screenHeight * 0.65,
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_drop_up,
                size: 32, color: kColorDarkText),
            onPressed: _decrementValue,
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: _scrollController,
              itemExtent: kItemSize,
              diameterRatio: 4.0,
              onSelectedItemChanged: (index) {
                final int newValue = index + kMinHWValue;
                if (newValue != hwValue) {
                  setState(() {
                    hwValue = newValue;
                    widget.onHWValueChanged(hwValue);
                  });
                }
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  final int displayValue = index + kMinHWValue;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        hwValue = displayValue;
                      });
                      _scrollToValue(hwValue);
                      widget.onHWValueChanged(hwValue);
                    },
                    child: Container(
                      height: kItemSize,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: hwValue == displayValue
                            ? kInnerShadow
                            : kDropShadow,
                        border: Border.all(
                          color: hwValue == displayValue
                              ? kColorDarkText
                              : kColorDarkGreen,
                          width: 1,
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        displayValue.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: hwValue == displayValue
                              ? kColorLightText
                              : kColorDarkGreen,
                          fontWeight: hwValue == displayValue
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
                childCount: kMaxHWValue - kMinHWValue + 1,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_drop_down,
                size: 32, color: kColorDarkText),
            onPressed: _incrementValue,
          ),
        ],
      ),
    );
  }
}
