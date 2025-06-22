import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/weather.dart';
import '../repositories/weather_repository.dart';

class GetWeatherForecast implements UseCase<List<Weather>, WeatherParams> {
  final WeatherRepository repository;

  GetWeatherForecast(this.repository);

  @override
  Future<Either<Failure, List<Weather>>> call(WeatherParams params) async {
    return await repository.getWeatherForecast(params.cityName);
  }
}

class WeatherParams extends Equatable {
  final String cityName;

  const WeatherParams({required this.cityName});

  @override
  List<Object> get props => [cityName];
}
