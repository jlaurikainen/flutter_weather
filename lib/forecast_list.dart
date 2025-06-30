import 'package:flutter/material.dart';
import 'package:weather/forecast_list_item.dart';
import 'package:weather/services/forecasts.dart';

class ForecastList extends StatelessWidget {
  final List<Forecast> forecasts;

  @override
  const ForecastList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: EdgeInsetsGeometry.directional(start: 32, end: 32),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: (forecasts)
              .skip(1)
              .take(24)
              .map((forecast) => ForecastListItem(forecast: forecast))
              .toList(),
        ),
      ),
    );
  }
}
