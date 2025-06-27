import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';
import 'package:weather/components/error-message/main.dart';
import 'package:weather/components/loading-indicator/main.dart';
import 'package:weather/observations.dart';
import 'services/forecasts.dart';
import 'services/observations.dart';

class Weather extends HookWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    final observations = useQuery(
      ["observations"],
      getWeatherObservations,
      refetchInterval: const Duration(minutes: 5),
    );
    final forecasts = useQuery(
      ["forecasts"],
      getWeatherForecasts,
      refetchInterval: const Duration(minutes: 5),
    );

    return Builder(
      builder: (context) {
        if (observations.isLoading || forecasts.isLoading) {
          return Center(child: LoadingIndicator());
        }

        if (observations.isError || forecasts.isError) {
          return Center(child: ErrorMessage(message: "There was an error."));
        }

        return Scaffold(
          backgroundColor: Color.from(
            alpha: 1,
            red: 0.1,
            green: 0.1,
            blue: 0.1,
          ),
          body: Center(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Observations(
                  temperature: observations.data,
                  weatherSymbol: forecasts.data?.firstOrNull?.weatherSymbol,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
