import 'package:flutter/material.dart';
import 'package:weather/components/weather_text/main.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: WeatherText(fontSize: 20, text: message));
  }
}
