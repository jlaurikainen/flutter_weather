import 'package:flutter/material.dart';

class WeatherText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool? secondary;
  final bool? thin;

  const WeatherText({
    super.key,
    required this.text,
    this.fontSize,
    this.secondary = false,
    this.thin = false,
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
        fontFamily: "Montserrat",
        fontSize: fontSize,
        fontVariations: <FontVariation>[
          FontVariation('wght', thin == true ? 100 : 200),
        ],
      ),
    );
  }
}
