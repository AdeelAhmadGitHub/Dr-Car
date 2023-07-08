import 'package:location/location.dart';

class MapUtils {
  final _location = Location();

  Future<LocationData?> fetchCurrentLocation() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          return null;
        }
      }
      return await _location.getLocation();
    } catch (_) {
      return null;
    }
  }
}
