import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/errors/exceptions.dart';

abstract class LocationService {
  Future<Position> getCurrentLocation();
  Future<bool> isLocationPermissionGranted();
  Future<bool> requestLocationPermission();
}

class LocationServiceImpl implements LocationService {
  @override
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw NetworkException('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw NetworkException('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw NetworkException('Location permissions are permanently denied');
    }

    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );
    } catch (e) {
      throw NetworkException('Failed to get current location: $e');
    }
  }

  @override
  Future<bool> isLocationPermissionGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
  }

  @override
  Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
  }
}
