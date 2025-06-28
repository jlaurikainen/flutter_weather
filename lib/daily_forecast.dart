import 'package:flutter/material.dart';
import 'package:weather/components/weather_text/main.dart';
import 'package:weather/services/forecasts.dart';
import 'package:weather/utils/number.dart';
import 'package:weather/utils/temperature.dart';
import 'package:weather/utils/time.dart';

class DailyForecast extends StatefulWidget {
  final List<Forecast>? forecasts;

  const DailyForecast({super.key, required this.forecasts});

  @override
  State<DailyForecast> createState() => DailyForecastState();
}

class DailyForecastState extends State<DailyForecast> {
  int nowHour = DateTime.now().toLocal().hour;

  @override
  Widget build(BuildContext context) {
    var minMaxTomorrow = getMinMaxTempOfRange(
      widget.forecasts,
      24 - nowHour,
      24,
    );
    var forecastsDayAfterTomorrow = (widget.forecasts ?? [])
        .skip(48 - nowHour)
        .take(24)
        .toList();
    var minMaxDayAfterTomorrow = getMinMaxTempOfRange(
      forecastsDayAfterTomorrow,
      0,
      24,
    );

    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 64,
      children: [
        Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            WeatherText(secondary: true, text: "Tomorrow"),
            WeatherText(
              fontSize: 16,
              text: "${decimalFormat(minMaxTomorrow.max)}°C",
            ),
            WeatherText(
              secondary: true,
              text: "${decimalFormat(minMaxTomorrow.min)}°C",
            ),
          ],
        ),
        Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            WeatherText(
              secondary: true,
              text: dateFormatter(forecastsDayAfterTomorrow.first.time),
            ),
            WeatherText(
              fontSize: 16,
              text: "${decimalFormat(minMaxDayAfterTomorrow.max)}°C",
            ),
            WeatherText(
              secondary: true,
              text: "${decimalFormat(minMaxDayAfterTomorrow.min)}°C",
            ),
          ],
        ),
      ],
    );
  }
}
