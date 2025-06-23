import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/services/location_service.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherByLocation implements UseCase<Weather, NoParams> {
  final WeatherRepository repository;
  final LocationService locationService;

  GetWeatherByLocation({
    required this.repository,
    required this.locationService,
  });

  @override
  Future<Either<Failure, Weather>> call(NoParams params) async {
    try {
      final position = await locationService.getCurrentLocation();
      final result = await repository.getCurrentWeatherByCoordinates(
        position.latitude,
        position.longitude,
      );
      return result;
    } catch (e) {
      return Left(NetworkFailure('Failed to get location: $e'));
    }
  }
}
