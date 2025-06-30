import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:weather/components/weather_text/main.dart';
import 'package:weather/constants.dart';
import 'package:weather/services/forecasts.dart';
import 'package:weather/utils/number.dart';
import 'package:weather/utils/time.dart';

class ForecastListItem extends StatelessWidget {
  final Forecast forecast;

  const ForecastListItem({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          WeatherText(secondary: true, text: timeFormatter(forecast.time)),
          Icon(
            getWeatherIcon(forecast.weatherSymbol),
            color: Color.from(alpha: 0.7, red: 1, green: 1, blue: 1),
            size: 24,
          ),
          WeatherText(
            fontSize: 16,
            text: "${decimalFormat(forecast.temperature)}°C",
          ),
          WeatherText(
            secondary: true,
            text: "${decimalFormat(forecast.windSpeedMS)}m/s",
          ),
          Transform.rotate(
            angle: forecast.windDirection * math.pi / 180,
            child: Icon(
              Symbols.arrow_downward,
              color: Color.from(alpha: 0.7, red: 1, green: 1, blue: 1),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
