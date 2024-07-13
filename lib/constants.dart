import 'package:flutter/material.dart';

const kColorLightBlue = Color(0xffB4DAF5);
const kColorLightGreen = Color(0xffBBEEBA);
const kColorLightYellow = Color(0xffFFECBA);
const kColorDarkText = Color(0xff112200);
const kColorDarkBrown = Color(0xff914C3C);
const kColorDarkGreen = Color(0xff467302);
const kColorDarkYellow = Color(0xffD2DD13);
const kColorLightText = Color(0xffEDF8E1);

const int minAge = 10;
const int maxAge = 100;
const itemSize = 64.0;

const int minHWValue = 40;
const int maxHWValue = 240;
const double itemHeight = itemSize;

const screenPadding = EdgeInsets.all(16.0);

const kInnerShadow = [
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

const kDropShadow = [
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

const kDropShadowBtn = [
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