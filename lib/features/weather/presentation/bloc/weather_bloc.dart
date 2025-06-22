import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/get_current_weather.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather getCurrentWeather;

  WeatherBloc({
    required this.getCurrentWeather,
  }) : super(WeatherEmpty()) {
    on<GetWeatherForCity>(_onGetWeatherForCity);
    on<RefreshWeather>(_onRefreshWeather);
  }

  String? _lastCityName;

  void _onGetWeatherForCity(
    GetWeatherForCity event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    _lastCityName = event.cityName;

    final failureOrWeather = await getCurrentWeather(
      WeatherParams(cityName: event.cityName),
    );

    failureOrWeather.fold(
      (failure) => emit(WeatherError(_mapFailureToMessage(failure))),
      (weather) => emit(WeatherLoaded(weather)),
    );
  }

  void _onRefreshWeather(
    RefreshWeather event,
    Emitter<WeatherState> emit,
  ) async {
    if (_lastCityName != null) {
      add(GetWeatherForCity(_lastCityName!));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      case NetworkFailure:
        return 'Network Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
