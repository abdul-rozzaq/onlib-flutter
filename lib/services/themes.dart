import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, primary: Colors.blueAccent),
  fontFamily: GoogleFonts.ubuntu().fontFamily,
);

class Styles {
  static TextStyle headline1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: Colors.grey[800],
  );
}
