
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/weather_utils.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';

class DetailedWeatherCard extends StatelessWidget {
  final Weather weather;

  const DetailedWeatherCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromARGB(51, 255, 255, 255), 
              width: 1.5,
            ),
            gradient:const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                 Color.fromARGB(64, 255, 255, 255), 
                 Color.fromARGB(26, 255, 255, 255), 
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailsGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsGrid() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: _buildDetailItem(
              Icons.visibility,
              'Visibility',
              '${(weather.visibility / 1000).toStringAsFixed(1)} km',
              _getVisibilityDescription(),
            )),
            Expanded(
                child: _buildDetailItem(
              Icons.water_drop,
              'Humidity',
              '${weather.humidity}%',
              _getHumidityDescription(),
            )),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: _buildDetailItem(
              Icons.speed,
              'Pressure',
              '${weather.pressure} hPa',
              _getPressureDescription(),
            )),
            Expanded(
                child: _buildDetailItem(
              Icons.air,
              'Wind',
              '${weather.windSpeed.toStringAsFixed(1)} m/s ${WeatherUtils.getWindDirection(weather.windDeg)}',
              _getWindDescription(),
            )),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: _buildDetailItem(
              Icons.thermostat_outlined,
              'Temperature Range',
              '${WeatherUtils.getTemperatureString(weather.tempMin)} - ${WeatherUtils.getTemperatureString(weather.tempMax)}',
              'Daily variation',
            )),
            Expanded(
                child: _buildDetailItem(
              Icons.location_on,
              'Location',
              weather.cityName,
              weather.country,
            )),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value, String description) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(51, 255, 255, 255), 
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(179, 255, 255, 255), 
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: const TextStyle(
              fontSize: 10,
              color: Color.fromARGB(153, 255, 255, 255), 
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _getVisibilityDescription() {
    final km = weather.visibility / 1000;
    if (km >= 10) return 'Excellent';
    if (km >= 5) return 'Good';
    if (km >= 2) return 'Moderate';
    return 'Poor';
  }

  String _getHumidityDescription() {
    if (weather.humidity >= 70) return 'High';
    if (weather.humidity >= 40) return 'Comfortable';
    return 'Low';
  }

  String _getPressureDescription() {
    if (weather.pressure >= 1020) return 'High';
    if (weather.pressure >= 1000) return 'Normal';
    return 'Low';
  }

  String _getWindDescription() {
    if (weather.windSpeed >= 10) return 'Strong';
    if (weather.windSpeed >= 5) return 'Moderate';
    return 'Light';
  }
}
