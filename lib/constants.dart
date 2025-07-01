import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

const String baseUrl =
    "https://opendata.fmi.fi/wfs?service=WFS&version=2.0.0&request=getFeature&storedquery_id=";

const Map<int, String> weatherStrings = {
  1: "Clear",
  2: "Partly Cloudy",
  3: "Cloudy",
  21: "Light Showers",
  22: "Showers",
  23: "Heavy Showers",
  31: "Light Rain",
  32: "Rain",
  33: "Heavy Rain",
  41: "Light Snow Showers",
  42: "Snow Showers",
  43: "Heavy Snow Showers",
  51: "Light Snow",
  52: "Snow",
  53: "Heavy Snow",
  61: "Thundershowers",
  62: "Heavy Thundershowers",
  63: "Thunder",
  64: "Heavy Thunder",
  71: "Light Sleet Showers",
  72: "Sleet Showers",
  73: "Heavy Sleet Showers",
  81: "Light Sleet",
  82: "Sleet",
  83: "Heavy Sleet",
  91: "Misty",
  92: "Foggy",
};

String getWeatherString(int? code) {
  return weatherStrings[code] ?? "";
}

const Map<int, IconData> weatherIcons = {
  1: Symbols.clear_day_rounded,
  2: Symbols.partly_cloudy_day_rounded,
  3: Symbols.cloud_rounded,
  21: Symbols.rainy_rounded,
  22: Symbols.rainy_rounded,
  23: Symbols.rainy_rounded,
  31: Symbols.rainy_rounded,
  32: Symbols.rainy_rounded,
  33: Symbols.rainy_rounded,
  41: Symbols.weather_snowy_rounded,
  42: Symbols.weather_snowy_rounded,
  43: Symbols.weather_snowy_rounded,
  51: Symbols.weather_snowy_rounded,
  52: Symbols.weather_snowy_rounded,
  53: Symbols.weather_snowy_rounded,
  61: Symbols.thunderstorm_rounded,
  62: Symbols.thunderstorm_rounded,
  63: Symbols.thunderstorm_rounded,
  64: Symbols.thunderstorm_rounded,
  71: Symbols.weather_hail_rounded,
  72: Symbols.weather_hail_rounded,
  73: Symbols.weather_hail_rounded,
  81: Symbols.weather_hail_rounded,
  82: Symbols.weather_hail_rounded,
  83: Symbols.weather_hail_rounded,
  91: Symbols.mist_rounded,
  92: Symbols.foggy_rounded,
};

dynamic getWeatherIcon(int weatherSymbol) {
  return weatherIcons[weatherSymbol];
}
