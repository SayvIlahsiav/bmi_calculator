import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.lightGreen,
  scaffoldBackgroundColor: kColorLightText,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: kColorDarkText,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: kColorDarkText,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: kColorDarkText,
    ),
  ),
);