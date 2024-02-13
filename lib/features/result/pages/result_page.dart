import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/features/quality/pages/quality_screen.dart';
import 'package:weather_app/features/temperature/pages/temperature_screen.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var _currentIndex = 0;
  final screens = const [
    TemperatureScreen(title: ''),
    QualityScreen(title: ''),
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
