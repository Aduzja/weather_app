import 'package:weather_app/core/constants/api_keys.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static String get apiKey => ApiKeys.weatherApiKey;
  static const String currentWeatherEndpoint = '/weather';
  static const String forecastEndpoint = '/forecast';
  static const String units = 'metric';
}
