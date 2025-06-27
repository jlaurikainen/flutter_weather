import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import "package:geolocator/geolocator.dart";
import 'package:weather/components/loading_indicator/main.dart';
import 'package:weather/utils/location.dart';
import "weather.dart";

void main() {
  runApp(
    QueryClientProvider(
      queryClient: QueryClient(),
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: Material(child: App()),
      ),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  LocationPermission? permissionGranted;
  Position? locationData;

  void getLocation() {
    requestLocationPermission().then((location) {
      setState(() {
        locationData = location.locationData;
        permissionGranted = location.permissionGranted;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    if (permissionGranted == null) {
      return Center(child: LoadingIndicator());
    }

    if (permissionGranted == LocationPermission.denied) {
      return Center(
        child: FilledButton(
          onPressed: getLocation,
          child: Text("Request Location"),
        ),
      );
    }

    return Weather(locationData: locationData);
  }
}
