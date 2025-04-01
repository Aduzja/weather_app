import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page.dart' show HomePage;
import 'package:weather_app/screens/splash_screen.dart' show SplashScreen;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
