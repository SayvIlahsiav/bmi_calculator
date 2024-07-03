import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.lightGreen,
  scaffoldBackgroundColor: kColorLightText,
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 48,
      fontWeight: FontWeight.w900,
      color: kColorDarkText,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: kColorDarkText,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: kColorDarkText,
    ),
  ),
);