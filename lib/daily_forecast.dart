import 'package:flutter/material.dart';
import 'package:weather/components/weather_text/main.dart';
import 'package:weather/utils/number.dart';

class DailyForecast extends StatelessWidget {
  final double max;
  final double min;
  final String title;

  const DailyForecast({
    super.key,
    required this.max,
    required this.min,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          WeatherText(secondary: true, text: title),
          WeatherText(fontSize: 16, text: "${decimalFormat(max)}°C"),
          WeatherText(secondary: true, text: "${decimalFormat(min)}°C"),
        ],
      ),
    );
  }
}
