import 'package:intl/intl.dart';

var decimalFormat = NumberFormat.decimalPatternDigits(
  decimalDigits: 1,
  locale: "fi_FI",
).format;
