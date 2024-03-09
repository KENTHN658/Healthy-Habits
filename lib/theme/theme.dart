import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Builds the theme for the application.
///
/// This function returns a ThemeData object with customized text theme using Google Fonts
/// and a color scheme based on a seed color.
/// Effective Dart: Usage has been followed in structuring this function.
ThemeData buildTheme() {
  var baseTheme = ThemeData();

  return baseTheme.copyWith(
    textTheme: GoogleFonts.notoSansThaiTextTheme(baseTheme.textTheme),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
