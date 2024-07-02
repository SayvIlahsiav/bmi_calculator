import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kColorLightBlue = Color(0xffB4DAF5);
const kColorLightGreen = Color(0xffBBEEBA);
const kColorLightYellow = Color(0xffFFECBA);
const kColorDarkText = Color(0xff112200);
const kColorDarkBrown = Color(0xff914C3C);
const kColorDarkGreen = Color(0xff467302);
const kColorDarkYellow = Color(0xffD2DD13);
const kColorLightText = Color(0xffEDF8E1);

final kTextAppName = Text(
  'BMI Calculator',
  style: GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: kColorDarkText,
      fontSize: 24,
      fontWeight: FontWeight.w900,
    ),
  ),
);

final kTextStyleLabels = GoogleFonts.roboto(
  textStyle: const TextStyle(
    color: kColorDarkGreen,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  )
);