import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetCurrentWeather implements UseCase<Weather, WeatherParams> {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  @override
  Future<Either<Failure, Weather>> call(WeatherParams params) async {
    return await repository.getCurrentWeather(params.cityName);
  }
}

class WeatherParams extends Equatable {
  final String cityName;

  const WeatherParams({required this.cityName});

  @override
  List<Object> get props => [cityName];
}
