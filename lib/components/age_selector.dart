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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    age = widget.initialAge;
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollToAge(age);
    });
  }

  void _scrollToAge(int age) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double centerOffset = (screenWidth - itemWidth) / 2;
    final double position = (age - 10) * itemWidth - centerOffset;
    _scrollController.animateTo(
      position,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
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
