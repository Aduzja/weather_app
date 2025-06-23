import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'injection_container.dart' as di;
import 'features/weather/presentation/bloc/weather_bloc.dart';
import 'features/weather/presentation/bloc/weather_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    BlocProvider(
      create: (_) => di.sl<WeatherBloc>()..add(const GetWeatherForCurrentLocation()),
      child: const WeatherApp(),
    ),
  );
}
