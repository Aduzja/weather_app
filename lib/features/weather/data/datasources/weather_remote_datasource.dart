import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
  Future<List<WeatherModel>> getWeatherForecast(String cityName);
  Future<WeatherModel> getCurrentWeatherByCoordinates(double lat, double lon);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.currentWeatherEndpoint}'
      '?q=$cityName'
      '&appid=${ApiConstants.apiKey}'
      '&units=${ApiConstants.units}',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    } else {
      throw ServerException('Failed to get weather data: ${response.statusCode}');
    }
  }

  @override
  Future<List<WeatherModel>> getWeatherForecast(String cityName) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.forecastEndpoint}'
      '?q=$cityName'
      '&appid=${ApiConstants.apiKey}'
      '&units=${ApiConstants.units}',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List forecasts = json['list'];

      return forecasts
          .map((forecast) => WeatherModel.fromJson({
                ...forecast,
                'name': json['city']['name'],
                'sys': {
                  'country': json['city']['country'],
                  'sunrise': json['city']['sunrise'],
                  'sunset': json['city']['sunset'],
                }
              }))
          .toList();
    } else {
      throw ServerException('Failed to get forecast data: ${response.statusCode}');
    }
  }

  @override
  Future<WeatherModel> getCurrentWeatherByCoordinates(double lat, double lon) async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.currentWeatherEndpoint}'
      '?lat=$lat&lon=$lon'
      '&appid=${ApiConstants.apiKey}'
      '&units=${ApiConstants.units}',
    );

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    } else {
      throw ServerException('Failed to get weather data: ${response.statusCode}');
    }
  }
}
