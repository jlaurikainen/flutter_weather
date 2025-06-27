import 'package:flutter/material.dart';
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
        Text(
          "$temperature°C",
          style: const TextStyle(
            color: Color.from(alpha: 0.7, red: 1, green: 1, blue: 1),
            fontSize: 60,
            fontFamily: "Inter",
          ),
        ),
        Text(
          getWeatherString(weatherSymbol),
          style: const TextStyle(
            color: Color.from(alpha: 0.5, red: 1, green: 1, blue: 1),
            fontSize: 20,
            fontFamily: "Inter",
          ),
        ),
      ],
    );
  }
}
