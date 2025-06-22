import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final int windDeg;
  final int visibility;
  final DateTime dateTime;
  final String country;
  final DateTime sunrise;
  final DateTime sunset;

  const Weather({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.visibility,
    required this.dateTime,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  @override
  List<Object> get props => [
        cityName,
        main,
        description,
        iconCode,
        temperature,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        windSpeed,
        windDeg,
        visibility,
        dateTime,
        country,
        sunrise,
        sunset,
      ];
}
