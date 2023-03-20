import 'package:flutter/material.dart';
import 'package:weather_app/features/location/pages/location_page.dart';
import 'package:weather_app/helpers/constants.dart';
import 'package:weather_app/widgets/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Logo(),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
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
              bottom: 60,
              child: Column(
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    'Potrzebujemy do tego Twojej lokalizacji',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.only(top: 15, bottom: 15),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Constants.colorOldLavender),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Zaczynamy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
