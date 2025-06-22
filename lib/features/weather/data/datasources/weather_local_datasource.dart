import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/weather_model.dart';

abstract class WeatherLocalDataSource {
  Future<WeatherModel> getLastWeather();
  Future<void> cacheWeather(WeatherModel weatherToCache);
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String cachedWeatherKey = 'CACHED_WEATHER';

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<WeatherModel> getLastWeather() {
    final jsonString = sharedPreferences.getString(cachedWeatherKey);
    if (jsonString != null) {
      return Future.value(WeatherModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException('No cached weather found');
    }
  }

  @override
  Future<void> cacheWeather(WeatherModel weatherToCache) {
    return sharedPreferences.setString(
      cachedWeatherKey,
      jsonEncode(weatherToCache.toJson()),
    );
  }
}
