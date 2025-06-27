import "package:http/http.dart" as http;
import "package:location/location.dart";
import "package:xml/xml.dart" as xml_parser;
import "../constants.dart";

class Forecasts {
  final List<Forecast> forecasts;
  final String? geoid;

  Forecasts({required this.forecasts, required this.geoid});
}

class Forecast {
  final double temperature;
  final int time;
  final int weatherSymbol;
  final double windDirection;
  final double windSpeedMS;

  Forecast({
    required this.temperature,
    required this.time,
    required this.weatherSymbol,
    required this.windDirection,
    required this.windSpeedMS,
  });
}

const String forecastsQuery =
    "${baseUrl}fmi::forecast::edited::weather::scandinavia::point::multipointcoverage";

Forecasts parseXML(String xml) {
  var doc = xml_parser.XmlDocument.parse(xml);

  // Get timestamps from the positions elements
  var positionsString = doc
      .findAllElements("gmlcov:positions")
      .first
      .innerText
      .trim();
  var positionLines = positionsString
      .split("\n")
      .map((line) => line.trim())
      .toList();
  var timeStamps = positionLines.map((line) => line.split(" ").last).toList();

  // Get forecast values
  var forecastValuesString = doc
      .findAllElements("gml:doubleOrNilReasonTupleList")
      .first
      .innerText
      .trim();
  var forecastLines = forecastValuesString
      .split("\n")
      .map((line) => line.trim())
      .toList();
  var forecastValues = forecastLines.map((line) => line.split(" ")).toList();

  // Get indexes of fields for wanted values
  var fieldNames = doc
      .findAllElements("swe:field")
      .map((field) => field.getAttribute("name"))
      .toList();
  var valueIndexes = [
    fieldNames.indexOf("Temperature"),
    fieldNames.indexOf("WindDirection"),
    fieldNames.indexOf("WindSpeedMS"),
    fieldNames.indexOf("WeatherSymbol3"),
  ];

  List<Forecast> forecasts = [];

  for (var i = 0; i < timeStamps.length; i++) {
    var forecastValue = forecastValues[i];

    forecasts.add(
      Forecast(
        temperature: double.parse(forecastValue[valueIndexes[0]]),
        time: int.parse(timeStamps[i]),
        weatherSymbol: double.parse(forecastValue[valueIndexes[3]]).round(),
        windDirection: double.parse(forecastValue[valueIndexes[1]]),
        windSpeedMS: double.parse(forecastValue[valueIndexes[2]]),
      ),
    );
  }

  var geoid = doc.findAllElements("gml:identifier").first.innerText;

  return Forecasts(forecasts: forecasts, geoid: geoid);
}

Future<Forecasts> getWeatherForecasts(LocationData? location) async {
  var now = DateTime.now();
  var starTime = now
      .copyWith(minute: 0, second: 0, millisecond: 0, microsecond: 0)
      .subtract(const Duration(hours: 1))
      .toUtc();
  var startTimeString = starTime.toIso8601String();
  var endTime = starTime.copyWith(day: starTime.day + 1);
  var endTimeString = endTime.toIso8601String();

  final response = await http.get(
    Uri.parse(
      "$forecastsQuery&starttime=$startTimeString&endtime=$endTimeString&latlon=${location?.latitude},${location?.longitude}",
    ),
  );

  if (response.statusCode == 200) {
    return parseXML(response.body);
  } else {
    throw Exception("Failed to load forecasts.");
  }
}
