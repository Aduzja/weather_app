import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6C63FF),
        brightness: Brightness.light,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
      ),
      cardTheme: CardThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6C63FF),
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      cardTheme: CardThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  // Custom gradient colors for weather backgrounds
  static const List<Color> sunnyGradient = [
    Color(0xFFFFB75A),
    Color(0xFFED8D3A),
  ];

  static const List<Color> cloudyGradient = [
    Color(0xFF7AC4E0),
    Color(0xFF4B91C9),
  ];

  static const List<Color> rainyGradient = [
    Color(0xFF5A72A0),
    Color(0xFF2E3F66),
  ];

  static const List<Color> nightGradient = [
    Color(0xFF1A1A2E),
    Color(0xFF16213E),
  ];

  static const List<Color> defaultGradient = [
    Color(0xFF6C63FF),
    Color(0xFF5A52D5),
  ];

  static List<Color> getGradientForWeather(String main, String icon) {
    if (icon.endsWith('n')) return nightGradient;

    switch (main.toLowerCase()) {
      case 'clear':
        return sunnyGradient;
      case 'clouds':
        return cloudyGradient;
      case 'rain':
      case 'drizzle':
      case 'thunderstorm':
        return rainyGradient;
      default:
        return defaultGradient;
    }
  }
}
