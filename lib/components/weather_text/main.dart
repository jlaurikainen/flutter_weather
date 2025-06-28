import 'package:flutter/material.dart';

class WeatherText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool? secondary;

  const WeatherText({
    super.key,
    required this.text,
    this.fontSize,
    this.secondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color.from(
          alpha: secondary == true ? 0.5 : 0.7,
          red: 1,
          green: 1,
          blue: 1,
        ),
        fontFamily: "Inter",
        fontSize: fontSize,
      ),
    );
  }
}
