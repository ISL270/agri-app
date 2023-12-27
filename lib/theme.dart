import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFFa5ce4a);

final theme = ThemeData(
  textTheme: GoogleFonts.openSansTextTheme(),
  appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
  colorSchemeSeed: primaryColor,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
