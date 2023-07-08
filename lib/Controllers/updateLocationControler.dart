import 'dart:async';

import 'package:geolocator/geolocator.dart';

String? latitude;
String? longitude;
double? dLatitude;
double? dLongitude;
class UpdateLocationController{
  Future<void> getLocation() async {
    print("/////////////////////////////////////////////");
    LocationPermission permission;
    bool servicesEnabled;
    servicesEnabled = await Geolocator.isLocationServiceEnabled();
    if (!servicesEnabled) {
      return Future.error("Your location services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Your location permissions are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we cannot request permissions.");
    }
    print('going to get the location');
    permission = await Geolocator.requestPermission();
    try {
      LocationSettings locationSetting = const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 100,
        // timeLimit: Duration(minutes: 1),
      );
      StreamSubscription<Position> positionStream =
      Geolocator.getPositionStream(locationSettings: locationSetting)
          .listen(
            (Position? position) async {

          dLatitude = position!.latitude;
          dLongitude= position.longitude;
          latitude = position.latitude.toString();
          longitude = position.longitude.toString();
          print(latitude);
          print(longitude);
        },
      );
    } catch (e)
    // ignore: empty_catches
        {}
  }

}