import 'package:flutter/material.dart';
import 'package:weather_app/helpers/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.colorMatisse,
              Constants.colorOldLavender,
              Constants.colorTapestry
            ],
          ),
        ),
        child: Center(
          child: Column(children: const []),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.temperatureLow,
              size: 30,
              color: Colors.black87,
            ),
            label: "Temperature"),
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.star,
              size: 30,
              color: Colors.black87,
            ),
            label: "Quality")
      ]),
    );
  }
}
