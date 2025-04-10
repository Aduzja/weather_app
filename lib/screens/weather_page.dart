import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_gradients.dart';


import 'package:weather_app/widgets/gradient_background.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final double _opacity = 1.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        gradient: AppGradients.splash,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const SizedBox(
              width: 100,
              child: Image(
                image: AssetImage(
                  'assets/icons/sunny.png',
                ),
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Weather',
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
