import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/features/weather/presentation/widgets/gradient_background.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _popularCities = [
    'Warsaw',
    'London',
    'New York',
    'Tokyo',
    'Paris',
    'Berlin',
    'Sydney',
    'Dubai',
    'Singapore',
    'Amsterdam'
  ];

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 30),
                    _buildSearchBar(),
                    const SizedBox(height: 30),
                    const Text(
                      'Popular Cities',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(230, 255, 255, 255)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildPopularCities(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(51, 255, 255, 255),
                  border: Border.all(
                    color: const Color.fromARGB(77, 255, 255, 255),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          'Search City',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(51, 255, 255, 255), // 0.2 opacity
            border: Border.all(
              color: const Color.fromARGB(77, 255, 255, 255), // 0.3 opacity
            ),
          ),
          child: TextField(
            controller: _controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter city name...',
              hintStyle: const TextStyle(color: Color.fromARGB(179, 255, 255, 255)), // 0.7 opacity
              prefixIcon: const Icon(
                Icons.search,
                color: Color.fromARGB(179, 255, 255, 255), // 0.7 opacity
              ),
              suffixIcon: IconButton(
                onPressed: _searchWeather,
                icon: const Icon(
                  Icons.send,
                  color: Color.fromARGB(230, 255, 255, 255), // 0.9 opacity
                ),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
            onSubmitted: (_) => _searchWeather(),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularCities() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _popularCities.length,
      itemBuilder: (context, index) {
        final city = _popularCities[index];
        return GestureDetector(
          onTap: () => _searchCity(city),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(38, 255, 255, 255), // 0.15 opacity
                  border: Border.all(
                    color: const Color.fromARGB(77, 255, 255, 255), // 0.3 opacity
                  ),
                ),
                child: Center(
                  child: Text(
                    city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _searchWeather() {
    if (_controller.text.trim().isNotEmpty) {
      _searchCity(_controller.text.trim());
    }
  }

  void _searchCity(String cityName) {
    context.read<WeatherBloc>().add(GetWeatherForCity(cityName));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
