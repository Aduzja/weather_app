import 'package:flutter/material.dart';
import '../widgets/gradient_background.dart';

import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        _opacity = _opacity == 1.0 ? 0.3 : 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        startColor: const Color(0xFF5054A0),
        endColor: const Color(0xFF3B3F80),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const SizedBox(
              width: 100,
              child: Image(
                image: AssetImage(
                  'assets/icons/weather-sunny.png',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Clean Air',
              style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Monitoring Air Quality & Weather',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const Spacer(),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  'Loading...',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
