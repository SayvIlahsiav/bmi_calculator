import 'package:flutter/material.dart';
import 'constants.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: kColorDarkText,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kColorDarkGreen,
  ),
  textTheme: TextTheme(
    headline1: kTextAppName.style,
    bodyText1: kTextStyleLabels,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: kColorDarkText),
    titleTextStyle: kTextAppName.style,
  ),
);