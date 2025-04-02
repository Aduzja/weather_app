import 'package:flutter/material.dart';
import '../widgets/gradient_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        startColor: const Color(0xFF7AC4E0),
        endColor: const Color(0xFF4B91C9),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Air Quality',
                  style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/air_quality'),
                child: const Text('Check Air Quality'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
