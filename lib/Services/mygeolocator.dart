import 'package:geolocator/geolocator.dart';

Position? _currentLocation;

class MyGeolocator {
  Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      // handle denied permission permanently
      return null;
    }
    final position = await Geolocator.getCurrentPosition();
    return position;
  }
}
