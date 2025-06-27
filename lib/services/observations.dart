import "package:http/http.dart" as http;
import "package:intl/intl.dart";
import "package:xml/xml.dart" as xml_parser;
import "../constants.dart";

const String observationsQuery =
    "${baseUrl}fmi::observations::weather::timevaluepair";

String parseXML(String xml) {
  var doc = xml_parser.XmlDocument.parse(xml);
  var obervationsList = doc.findAllElements("om:result").first;
  var latestObservation = obervationsList.findAllElements("wml2:value").last;
  var temperature = double.parse(latestObservation.innerText);

  return NumberFormat.decimalPatternDigits(
    decimalDigits: 1,
    locale: "fi_FI",
  ).format(temperature);
}

Future<String> getWeatherObservations(String? geoid) async {
  var now = DateTime.now();
  var startTime = now
      .copyWith(second: 0, millisecond: 0, microsecond: 0)
      .subtract(const Duration(minutes: 30))
      .toUtc()
      .toIso8601String();

  final response = await http.get(
    Uri.parse("$observationsQuery&starttime=$startTime&geoid=$geoid"),
  );

  if (response.statusCode == 200) {
    return parseXML(response.body);
  } else {
    throw Exception("Failed to load observations.");
  }
}
