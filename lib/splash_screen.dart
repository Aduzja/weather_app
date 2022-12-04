import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wb_cloudy_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Raleway'),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Sprawdź temperaturę\noraz jakość powietrza',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Raleway'),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 60,
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Ładowanie danych... proszę czekać',
                  style: TextStyle(
                      color: Colors.white, fontSize: 10, fontFamily: 'Raleway'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
