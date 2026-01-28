import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final heading5 = GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final heading6 = GoogleFonts.poppins(
  fontSize: 19,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);
final subtitle = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);
final bodyText = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

final textTheme = TextTheme(
  headlineMedium: heading5,
  headlineSmall: heading6,
  labelMedium: subtitle,
  bodyMedium: bodyText,
);
