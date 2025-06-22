import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/utils/weather_utils.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/weather.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white.withValues(alpha: 51),
                width: 1.5,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 64),
                  Colors.white.withValues(alpha: 26),
                ],
              ),
            ),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildMainWeather(),
                const SizedBox(height: 30),
                _buildWeatherDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather.cityName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              DateFormatter.formatFullDate(weather.dateTime),
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 204),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withValues(alpha: 51),
          ),
          child: Text(
            WeatherUtils.getWeatherIcon(weather.iconCode),
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ],
    );
  }

  Widget _buildMainWeather() {
    return Column(
      children: [
        Text(
          WeatherUtils.getTemperatureString(weather.temperature),
          style: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.w300,
            color: Colors.white,
            height: 1,
          ),
        ),
        Text(
          WeatherUtils.capitalizeFirst(weather.description),
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withValues(alpha: 230),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Feels like ${WeatherUtils.getTemperatureString(weather.feelsLike)}',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withValues(alpha: 179),
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherDetails() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 38),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailItem(
                '💨',
                '${weather.windSpeed.toStringAsFixed(1)} m/s',
                'Wind',
              ),
              _buildDetailItem(
                '💧',
                '${weather.humidity}%',
                'Humidity',
              ),
              _buildDetailItem(
                '🌡️',
                '${weather.pressure} hPa',
                'Pressure',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDetailItem(
                '🌅',
                DateFormatter.formatTime(weather.sunrise),
                'Sunrise',
              ),
              _buildDetailItem(
                '👁️',
                '${(weather.visibility / 1000).toStringAsFixed(1)} km',
                'Visibility',
              ),
              _buildDetailItem(
                '🌇',
                DateFormatter.formatTime(weather.sunset),
                'Sunset',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String icon, String value, String label) {
    return Column(
      children: [
        Text(
          icon,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withValues(alpha: 179),
          ),
        ),
      ],
    );
  }
}
