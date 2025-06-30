import 'package:flutter/material.dart';
import 'package:weather/daily_forecast.dart';
import 'package:weather/services/forecasts.dart';
import 'package:weather/utils/temperature.dart';
import 'package:weather/utils/time.dart';

class DailyForecasts extends StatefulWidget {
  final List<Forecast> forecasts;

  const DailyForecasts({super.key, required this.forecasts});

  @override
  State<DailyForecasts> createState() => DailyForecastsState();
}

class DailyForecastsState extends State<DailyForecasts> {
  int nowHour = DateTime.now().toLocal().hour;

  @override
  Widget build(BuildContext context) {
    var minMaxTomorrow = getMinMaxTempOfRange(
      widget.forecasts,
      24 - nowHour,
      24,
    );
    var forecastsDayAfterTomorrow = (widget.forecasts)
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
      spacing: 32,
      children: [
        DailyForecast(
          max: minMaxTomorrow.max,
          min: minMaxTomorrow.min,
          title: "Tomorrow",
        ),
        DailyForecast(
          max: minMaxDayAfterTomorrow.max,
          min: minMaxDayAfterTomorrow.min,
          title: dateFormatter(forecastsDayAfterTomorrow.first.time),
        ),
      ],
    );
  }
}
