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
    return Flexible(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              child: Icon(
                getWeatherIcon(weatherSymbol!),
                color: Color.fromARGB(255, 33, 33, 33),
                size: 240,
              ),
            ),
            Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherText(fontSize: 60, text: "$temperature°C", thin: true),
                WeatherText(
                  fontSize: 20,
                  secondary: true,
                  text: getWeatherString(weatherSymbol),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
