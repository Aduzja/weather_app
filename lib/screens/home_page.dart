import 'package:flutter/material.dart';
import 'package:weather_app/screens/air_page.dart';
import 'package:weather_app/screens/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  var screens = [
    const WeatherPage(),
    const AirPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0 ? const WeatherPage() : const AirPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_outlined), label: 'Weather', backgroundColor: Color(0xFF3B3F80)),
          BottomNavigationBarItem(
              icon: Icon(Icons.eco_outlined), label: 'Air Quality', backgroundColor: Color(0xFF3B3F80)),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
