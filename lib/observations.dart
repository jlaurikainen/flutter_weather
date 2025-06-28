import 'package:flutter/material.dart';
import 'package:weather/components/weather_text/main.dart';
import 'package:weather/constants.dart';

class Observations extends StatelessWidget {
  final String? temperature;
  final int? weatherSymbol;

  const Observations({
    super.key,
    required this.temperature,
    required this.weatherSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeatherText(fontSize: 60, text: "$temperature°C"),
        WeatherText(
          fontSize: 20,
          secondary: true,
          text: getWeatherString(weatherSymbol),
        ),
      ],
    );
  }
}
