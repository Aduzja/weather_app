import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/permission_page.dart';
import 'package:weather_app/widgets/app_gradients.dart';

import 'package:weather_app/widgets/gradient_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0;

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
              opacity: opacity,
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

  @override
  void initState() {
    super.initState();
    if (permissionDenied()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PermissionPage(),
        ),
      );
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        executeOnceAfterBuildComplete();
      });
    }
  }

  bool permissionDenied() {
    return false;
  }

  void executeOnceAfterBuildComplete() async {
    WeatherFactory wf = WeatherFactory("acfdca911f9abe472b02a8761030a9ae");
    Weather weather = await wf.currentWeatherByCityName("Warsaw");
    log(weather.toString() as num);
  }
}
