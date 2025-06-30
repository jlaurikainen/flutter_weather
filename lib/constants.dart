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
  1: Symbols.clear_day,
  2: Symbols.partly_cloudy_day,
  3: Symbols.cloud,
  21: Symbols.rainy,
  22: Symbols.rainy,
  23: Symbols.rainy,
  31: Symbols.rainy,
  32: Symbols.rainy,
  33: Symbols.rainy,
  41: Symbols.weather_snowy,
  42: Symbols.weather_snowy,
  43: Symbols.weather_snowy,
  51: Symbols.weather_snowy,
  52: Symbols.weather_snowy,
  53: Symbols.weather_snowy,
  61: Symbols.thunderstorm,
  62: Symbols.thunderstorm,
  63: Symbols.thunderstorm,
  64: Symbols.thunderstorm,
  71: Symbols.weather_hail,
  72: Symbols.weather_hail,
  73: Symbols.weather_hail,
  81: Symbols.weather_hail,
  82: Symbols.weather_hail,
  83: Symbols.weather_hail,
  91: Symbols.mist,
  92: Symbols.foggy,
};

dynamic getWeatherIcon(int weatherSymbol) {
  return weatherIcons[weatherSymbol];
}
