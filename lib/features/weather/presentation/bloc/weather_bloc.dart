import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/usecases/get_current_weather.dart';
import 'package:weather_app/features/weather/domain/usecases/get_weather_by_location.dart';
import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather getCurrentWeather;
  final GetWeatherByLocation getWeatherByLocation;

  WeatherBloc({
    required this.getCurrentWeather,
    required this.getWeatherByLocation,
  }) : super(WeatherEmpty()) {
    on<GetWeatherForCity>(_onGetWeatherForCity);
    on<GetWeatherForCurrentLocation>(_onGetWeatherForCurrentLocation);
    on<RefreshWeather>(_onRefreshWeather);
  }

  String? _lastCityName;
  bool _isLocationBased = false;

  void _onGetWeatherForCity(
    GetWeatherForCity event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    _lastCityName = event.cityName;
    _isLocationBased = false;

    final failureOrWeather = await getCurrentWeather(
      WeatherParams(cityName: event.cityName),
    );

    failureOrWeather.fold(
      (failure) => emit(WeatherError(_mapFailureToMessage(failure))),
      (weather) => emit(WeatherLoaded(weather)),
    );
  }

  void _onGetWeatherForCurrentLocation(
    GetWeatherForCurrentLocation event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    _isLocationBased = true;

    final failureOrWeather = await getWeatherByLocation(const NoParams());

    failureOrWeather.fold(
      (failure) => emit(WeatherError(_mapFailureToMessage(failure))),
      (weather) => emit(WeatherLoaded(weather)),
    );
  }

  void _onRefreshWeather(
    RefreshWeather event,
    Emitter<WeatherState> emit,
  ) async {
    if (_isLocationBased) {
      add(const GetWeatherForCurrentLocation());
    } else if (_lastCityName != null) {
      add(GetWeatherForCity(_lastCityName!));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Error - Please try again';
      case CacheFailure:
        return 'No cached data available';
      case NetworkFailure:
        return 'No internet connection';
      default:
        return 'Something went wrong';
    }
  }
}
