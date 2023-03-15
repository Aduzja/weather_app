import 'package:flutter/material.dart';
import 'package:weather_app/helpers/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/permission_page.dart';
import 'package:weather_app/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => {
        if (havePermission())
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PermissionPage(title: widget.title),
              ),
            ),
          }
        else
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
          }
      },
    );

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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.rainbow,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Sprawdź temperaturę\noraz jakość powietrza',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 120,
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Ładowanie danych... proszę czekać',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  havePermission() {
    return true;
  }
}
