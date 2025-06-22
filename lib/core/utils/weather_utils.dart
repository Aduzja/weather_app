import '../constants/app_constants.dart';

class WeatherUtils {
  static String getWeatherIcon(String iconCode) {
    return AppConstants.weatherIcons[iconCode] ?? '🌤️';
  }

  static String getTemperatureString(double temperature) {
    return '${temperature.round()}°C';
  }

  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static String getWindDirection(int degrees) {
    const directions = [
      'N',
      'NNE',
      'NE',
      'ENE',
      'E',
      'ESE',
      'SE',
      'SSE',
      'S',
      'SSW',
      'SW',
      'WSW',
      'W',
      'WNW',
      'NW',
      'NNW'
    ];

    int index = ((degrees / 22.5) + 0.5).floor() % 16;
    return directions[index];
  }

  static String getVisibilityDescription(int visibility) {
    if (visibility >= 10000) return 'Excellent';
    if (visibility >= 5000) return 'Good';
    if (visibility >= 2000) return 'Moderate';
    if (visibility >= 1000) return 'Poor';
    return 'Very Poor';
  }
}
