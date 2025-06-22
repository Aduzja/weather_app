import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherForCity extends WeatherEvent {
  final String cityName;

  const GetWeatherForCity(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class GetWeatherForCurrentLocation extends WeatherEvent {
  const GetWeatherForCurrentLocation();
}

class RefreshWeather extends WeatherEvent {
  const RefreshWeather();
}
