import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import 'package:location/location.dart';
import "weather.dart";

void main() {
  runApp(QueryClientProvider(queryClient: QueryClient(), child: const App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  Location location = Location();
  bool serviceEnabled = false;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  Future<void> requestLocationPermission() async {
    serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();

      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

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

    if (permissionGranted == PermissionStatus.denied) {
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
