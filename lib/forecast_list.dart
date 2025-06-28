import 'package:flutter/material.dart';
import 'package:weather/components/weather_text/main.dart';
import 'package:weather/services/forecasts.dart';
import 'package:weather/utils/number.dart';
import 'package:weather/utils/time.dart';

class ForecastList extends StatelessWidget {
  final List<Forecast>? forecasts;

  @override
  const ForecastList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: Padding(
        padding: EdgeInsetsGeometry.directional(start: 32, end: 32),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: (forecasts ?? []).skip(1).take(24).map((forecast) {
            return SizedBox(
              width: 64,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  WeatherText(
                    secondary: true,
                    text: timeFormatter(forecast.time),
                  ),
                  WeatherText(
                    fontSize: 16,
                    text: "${decimalFormat(forecast.temperature)}°C",
                  ),
                  WeatherText(
                    secondary: true,
                    text: "${decimalFormat(forecast.windSpeedMS)}m/s",
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
