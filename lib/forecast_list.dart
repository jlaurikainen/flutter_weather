import 'package:flutter/material.dart';
import 'package:weather/services/forecasts.dart';
import 'package:weather/utils/number.dart';
import 'package:weather/utils/time.dart';

class ForecastList extends StatelessWidget {
  final List<Forecast>? forecasts;

  @override
  const ForecastList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      child: Padding(
        padding: EdgeInsetsGeometry.directional(start: 32, end: 32),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children:
              forecasts?.map((forecast) {
                return SizedBox(
                  width: 66,
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4,
                    children: [
                      Text(
                        timeFormatter(
                          DateTime.fromMillisecondsSinceEpoch(
                            forecast.time * 1000,
                          ),
                        ),
                        style: TextStyle(
                          color: Color.from(
                            alpha: 0.5,
                            red: 1,
                            green: 1,
                            blue: 1,
                          ),
                          fontFamily: "Inter",
                        ),
                      ),
                      Text(
                        "${decimalFormat(forecast.temperature)}°C",
                        style: TextStyle(
                          color: Color.from(
                            alpha: 0.7,
                            red: 1,
                            green: 1,
                            blue: 1,
                          ),
                          fontFamily: "Inter",
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${decimalFormat(forecast.windSpeedMS)}m/s",
                        style: TextStyle(
                          color: Color.from(
                            alpha: 0.5,
                            red: 1,
                            green: 1,
                            blue: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList() ??
              [],
        ),
      ),
    );
  }
}
