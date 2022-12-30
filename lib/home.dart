import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/quality_screen.dart';
import 'package:weather_app/temperature_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final screens = const [
    TemperatureScreen(title: 'fds'),
    QualityScreen(title: 'fdsfdsfdsf'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (index) => setState(() => _currentIndex = index),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.temperatureLow,
                  size: 25,
                  color: Colors.black87,
                ),
                label: "Temperature"),
            BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.star,
                  size: 25,
                  color: Colors.black87,
                ),
                label: "Quality")
          ]),
    );
  }
}
