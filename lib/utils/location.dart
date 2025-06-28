import 'package:geolocator/geolocator.dart';

class LocationState {
  Position? locationData;
  LocationPermission? permissionGranted;

  LocationState({this.locationData, this.permissionGranted});
}

Future<LocationState> requestLocationPermission() async {
  bool serviceEnabled = false;
  LocationPermission? permissionGranted;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return Future.error("Location services are disabled.");
  }

  permissionGranted = await Geolocator.checkPermission();

  if (permissionGranted == LocationPermission.denied) {
    permissionGranted = await Geolocator.requestPermission();

    if (permissionGranted == LocationPermission.denied) {
      return Future.error("Location permissions are denied.");
    }
  }

  return LocationState(
    locationData: await Geolocator.getLastKnownPosition(),
    permissionGranted: permissionGranted,
  );
}
