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
        gradient: AppGradients.sunny,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const Text(
              'Friday, 10 April 2025, 20:35',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 160,
              child: Image(
                image: AssetImage(
                  'assets/icons/sunny.png',
                ),
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'sunny'.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '12°C',
              style: TextStyle(fontSize: 64, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text('Perceived 10°C', style: TextStyle(fontSize: 18, color: Colors.white70)),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Icon(Icons.speed, color: Colors.white, size: 30), // Ciśnienie
                    SizedBox(height: 6),
                    Text('Pressure', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 4),
                    Text('1013 hPa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.air, color: Colors.white, size: 30), // Wiatr
                    SizedBox(height: 6),
                    Text('Wind', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 4),
                    Text('12 km/h', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.water_drop, color: Colors.white, size: 30), // Opady
                    SizedBox(height: 6),
                    Text('Precipitation', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 4),
                    Text('0,3 mm / 12 h', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: const [
                    Icon(Icons.wb_sunny, color: Colors.white, size: 30), // UV Index
                    SizedBox(height: 6),
                    Text('UV Index', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 4),
                    Text('5', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
