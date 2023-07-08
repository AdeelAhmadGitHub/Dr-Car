import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../map_utils.dart';
var latLng;
Set<Marker> markersList = {};
GoogleMapController? googleMapController;

getCurrentLocation() async {
  LocationData? location = await MapUtils().fetchCurrentLocation();
  final lat = location!.latitude;
  final lng = location.longitude;
  latLng = LatLng(lat!, lng!);
  markersList.clear();
  markersList.add(
    Marker(
      markerId: const MarkerId("002"),
      position: LatLng(lat, lng),
      infoWindow: const InfoWindow(title: 'Current Location'),
    ),
  );
  // setState(() {});

  googleMapController
      ?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  print("$lat");
  print("$lng");
}
