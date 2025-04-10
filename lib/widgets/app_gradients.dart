import 'package:flutter/material.dart';

class AppGradients {
  // Jakość powietrza
  static const Gradient airGood = LinearGradient(
    colors: [Color(0xFFA1D6DA), Color(0xFF7AB3C8)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient airModerate = LinearGradient(
    colors: [Color(0xFFF2CEAB), Color(0xFFE5A876)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient airBad = LinearGradient(
    colors: [Color(0xFFE37F98), Color(0xFFC94B6A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Splash screen
  static const Gradient splash = LinearGradient(
    colors: [Color(0xFF5054A0), Color(0xFF3B3F80)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Permission page
  static const Gradient permission = LinearGradient(
    colors: [Color(0xFF2C5364), Color(0xFF203A43)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Pogoda
  static const Gradient sunny = LinearGradient(
    colors: [Color(0xFFFDC830), Color(0xFFF37335)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient cloudy = LinearGradient(
    colors: [Color(0xFFB2B2B2), Color(0xFF6E6E6E)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient rainy = LinearGradient(
    colors: [Color(0xFFA3A5DD), Color(0xFF7174C1)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient snowy = LinearGradient(
    colors: [Color(0xFFEAF6FF), Color(0xFFBBD2E1)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient stormy = LinearGradient(
    colors: [Color(0xFF6C7583), Color(0xFF444B54)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient night = LinearGradient(
    colors: [Color(0xFF2E3B55), Color(0xFF1B2538)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
