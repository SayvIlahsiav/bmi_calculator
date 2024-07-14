import 'package:flutter/material.dart';

// Color Constants
const kColorLightBlue = Color(0xffB4DAF5);
const kColorLightGreen = Color(0xffBBEEBA);
const kColorLightYellow = Color(0xffFFECBA);
const kColorDarkText = Color(0xff112200);
const kColorDarkBrown = Color(0xff914C3C);
const kColorDarkGreen = Color(0xff467302);
const kColorDarkYellow = Color(0xffD2DD13);
const kColorLightText = Color(0xffEDF8E1);

// Age Constants
const int kMinAge = 10;
const int kMaxAge = 100;

// Height/Weight Constants
const int kMinHWValue = 40;
const int kMaxHWValue = 240;

// Size Constants
const double kItemSize = 64.0;

// Padding Constants
const EdgeInsets kScreenPadding = EdgeInsets.all(16.0);

// Shadow Constants
const List<BoxShadow> kInnerShadow = [
  BoxShadow(
    color: kColorDarkText,
    blurRadius: 2,
    spreadRadius: -0.2,
    offset: Offset(0, -0.2),
    blurStyle: BlurStyle.inner,
  ),
  BoxShadow(
    color: kColorDarkGreen,
    blurRadius: 8,
    spreadRadius: -0.2,
    offset: Offset(1, 1),
    blurStyle: BlurStyle.inner,
  ),
];

const List<BoxShadow> kDropShadow = [
  BoxShadow(
    color: kColorDarkText,
    blurRadius: 1,
    spreadRadius: -1,
  ),
  BoxShadow(
    color: kColorLightText,
    blurRadius: 4,
    spreadRadius: -1,
    offset: Offset(-1, -1),
  ),
];

const List<BoxShadow> kDropShadowBtn = [
  BoxShadow(
    color: kColorDarkText,
    blurRadius: 1,
    spreadRadius: -1,
  ),
  BoxShadow(
    color: kColorDarkGreen,
    blurRadius: 8,
    spreadRadius: -1,
    offset: Offset(-1, -1),
  ),
];
