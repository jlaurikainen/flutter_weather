import 'package:flutter/material.dart';
import 'package:weather/constants.dart';
import 'services/observations.dart';
import 'services/forecasts.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => WeatherState();
}

class WeatherState extends State<Weather> {
  late String temperature = "";
  late List<Forecast> forecasts = [];

  @override
  void initState() {
    getWeatherObservations().then((responseTransform) {
      setState(() {
        temperature = responseTransform;
      });
    });

    getWeatherForecasts().then((responseTransform) {
      setState(() {
        forecasts = responseTransform;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.from(alpha: 1, red: 0.1, green: 0.1, blue: 0.1),
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$temperature°C",
              style: const TextStyle(
                color: Color.from(alpha: 0.7, red: 1, green: 1, blue: 1),
                fontSize: 60,
                fontFamily: "Inter",
              ),
            ),
            Text(
              getWeatherString(forecasts.firstOrNull?.weatherSymbol),
              style: const TextStyle(
                color: Color.from(alpha: 0.5, red: 1, green: 1, blue: 1),
                fontSize: 20,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
