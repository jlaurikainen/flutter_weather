import 'dart:math';
import 'package:weather/services/forecasts.dart';

class MinMaxTemperatures {
  final double min;
  final double max;

  MinMaxTemperatures({required this.min, required this.max});
}

MinMaxTemperatures getMinMaxTempOfRange(
  List<Forecast>? forecasts,
  int skip,
  int take,
) {
  var temperatureInRange = (forecasts ?? [])
      .skip(skip)
      .take(take)
      .map((f) => f.temperature);

  return MinMaxTemperatures(
    min: temperatureInRange.reduce(min),
    max: temperatureInRange.reduce(max),
  );
}
