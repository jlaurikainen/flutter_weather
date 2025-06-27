import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import "weather.dart";
import "package:geolocator/geolocator.dart";

void main() {
  runApp(QueryClientProvider(queryClient: QueryClient(), child: const App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  bool serviceEnabled = false;
  LocationPermission? permissionGranted;
  Position? locationData;

  Future<void> requestLocationPermission() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return;
    }

    permissionGranted = await Geolocator.checkPermission();

    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();

      if (permissionGranted == LocationPermission.denied) {
        return;
      }
    }

    locationData = await Geolocator.getCurrentPosition();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    if (permissionGranted == null) {
      return MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: Center(),
      );
    }

    if (permissionGranted == LocationPermission.denied) {
      return MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: Center(
          child: ElevatedButton(
            onPressed: requestLocationPermission,
            child: const Text("Request Location Permission"),
          ),
        ),
      );
    }

    return QueryClientProvider(
      queryClient: QueryClient(),
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: Weather(locationData: locationData),
      ),
    );
  }
}
