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
