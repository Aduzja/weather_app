import 'package:flutter/material.dart';
import 'package:weather_app/config/theme/app_theme.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final String? weatherMain;
  final String? weatherIcon;

  const GradientBackground({
    super.key,
    required this.child,
    this.weatherMain,
    this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = weatherMain != null && weatherIcon != null
        ? AppTheme.getGradientForWeather(weatherMain!, weatherIcon!)
        : AppTheme.defaultGradient;

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
      ),
      child: child,
    );
  }
}
