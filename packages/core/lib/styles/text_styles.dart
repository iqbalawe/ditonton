import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kHeading5 = GoogleFonts.poppins(
  fontSize: 23,
  fontWeight: FontWeight.w400,
);
final kHeading6 = GoogleFonts.poppins(
  fontSize: 19,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);
final kSubtitle = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);
final kBodyText = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final kTextTheme = TextTheme(
  headlineMedium: kHeading5,
  headlineSmall: kHeading6,
  labelMedium: kSubtitle,
  bodyMedium: kBodyText,
);
