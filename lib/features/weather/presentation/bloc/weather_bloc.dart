import 'dart:async';

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
  Timer? _timeoutTimer;

  void _onGetWeatherForCity(
    GetWeatherForCity event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    _lastCityName = event.cityName;
    _isLocationBased = false;

    _startTimeoutTimer(emit);

    try {
      final failureOrWeather = await getCurrentWeather(
        WeatherParams(cityName: event.cityName),
      ).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          throw TimeoutException('Request timed out', const Duration(seconds: 15));
        },
      );

      _cancelTimeoutTimer();

      failureOrWeather.fold(
        (failure) => emit(WeatherError(_mapFailureToMessage(failure))),
        (weather) => emit(WeatherLoaded(weather)),
      );
    } on TimeoutException {
      _cancelTimeoutTimer();
      emit(const WeatherError('Request timed out. Please check your internet connection and try again.'));
    } catch (e) {
      _cancelTimeoutTimer();
      emit(WeatherError('An unexpected error occurred: ${e.toString()}'));
    }
  }

  void _onGetWeatherForCurrentLocation(
    GetWeatherForCurrentLocation event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoading());
    _isLocationBased = true;

    _startTimeoutTimer(emit);

    try {
      final failureOrWeather = await getWeatherByLocation(const NoParams()).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          throw TimeoutException('Location request timed out', const Duration(seconds: 20));
        },
      );

      _cancelTimeoutTimer();

      failureOrWeather.fold(
        (failure) => emit(WeatherError(_mapFailureToMessage(failure))),
        (weather) => emit(WeatherLoaded(weather)),
      );
    } on TimeoutException {
      _cancelTimeoutTimer();
      emit(const WeatherError('Location request timed out. Please try again or search for a city manually.'));
    } catch (e) {
      _cancelTimeoutTimer();
      emit(WeatherError('Failed to get location: ${e.toString()}'));
    }
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

  void _startTimeoutTimer(Emitter<WeatherState> emit) {
    _cancelTimeoutTimer();
    _timeoutTimer = Timer(const Duration(seconds: 30), () {
      if (!emit.isDone) {
        emit(const WeatherError('Request is taking too long. Please check your internet connection.'));
      }
    });
  }

  void _cancelTimeoutTimer() {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Error - Please try again later';
      case CacheFailure:
        return 'No cached data available. Please check your internet connection.';
      case NetworkFailure:
        return 'No internet connection. Please check your network settings.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  @override
  Future<void> close() {
    _cancelTimeoutTimer();
    return super.close();
  }
}
