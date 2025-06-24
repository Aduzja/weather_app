import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/routes/app_routes.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_state.dart';
import 'package:weather_app/features/weather/presentation/widgets/detailed_weather_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/gradient_background.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            return GradientBackground(
              weatherMain: state.weather.main,
              weatherIcon: state.weather.iconCode,
              child: _buildWeatherContent(context, state),
            );
          }
          return GradientBackground(
            child: _buildOtherStates(context, state),
          );
        },
      ),
    );
  }

  Widget _buildWeatherContent(BuildContext context, WeatherLoaded state) {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  WeatherCard(weather: state.weather),
                  DetailedWeatherCard(weather: state.weather),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherStates(BuildContext context, WeatherState state) {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: Center(
              child: _buildStateWidget(context, state),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
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
                child: const Text(
                  'WeatherWise',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              _buildGlassButton(
                context,
                Icons.my_location,
                () => context.read<WeatherBloc>().add(const GetWeatherForCurrentLocation()),
              ),
              const SizedBox(width: 12),
              _buildGlassButton(
                context,
                Icons.search,
                () => Navigator.pushNamed(context, AppRoutes.search),
              ),
              const SizedBox(width: 12),
              _buildGlassButton(
                context,
                Icons.refresh,
                () => context.read<WeatherBloc>().add(const RefreshWeather()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGlassButton(BuildContext context, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStateWidget(BuildContext context, WeatherState state) {
    if (state is WeatherLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(51, 255, 255, 255), 
                  border: Border.all(
                    color: const Color.fromARGB(77, 255, 255, 255), 
                  ),
                ),
                child: const Column(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 4,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Getting weather data...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'This may take a few moments',
                      style: TextStyle(
                        color: Color.fromARGB(179, 255, 255, 255), 
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (state is WeatherError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(51, 255, 255, 255), 
                  border: Border.all(
                    color: const Color.fromARGB(77, 255, 255, 255), 
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color:  Color.fromARGB(77, 255, 255, 255), 
                      ),
                      child: const Icon(
                        Icons.cloud_off,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Unable to get weather data',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      state.message,
                      style: const TextStyle(
                        color: Color.fromARGB(204, 255, 255, 255), 
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildRetryButton(
                          'Try Again',
                          Icons.refresh,
                          () => context.read<WeatherBloc>().add(const RefreshWeather()),
                        ),
                        _buildRetryButton(
                          'Use Location',
                          Icons.my_location,
                          () => context.read<WeatherBloc>().add(const GetWeatherForCurrentLocation()),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildRetryButton(String text, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(51, 255, 255, 255), 
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(
            color: Color.fromARGB(77, 255, 255, 255), 
          ),
        ),
      ),
    );
  }
}



