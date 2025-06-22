import 'package:flutter/material.dart';
import '../../features/weather/presentation/pages/home_page.dart';
import '../../features/weather/presentation/pages/search_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String search = '/search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case search:
        return MaterialPageRoute(
          builder: (_) => const SearchPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}
