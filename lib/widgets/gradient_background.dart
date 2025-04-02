import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final Widget child;

  const GradientBackground({
    super.key,
    required this.startColor,
    required this.endColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [startColor, endColor],
        ),
      ),
      child: child,
    );
  }
}
