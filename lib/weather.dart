import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fquery/fquery.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/components/error_message/main.dart';
import 'package:weather/components/loading_indicator/main.dart';
import 'package:weather/daily_forecast.dart';
import 'package:weather/forecast_list.dart';
import 'package:weather/observations.dart';
import 'services/forecasts.dart';
import 'services/observations.dart';

class Weather extends HookWidget {
  final Position? locationData;

  const Weather({super.key, required this.locationData});

  @override
  Widget build(BuildContext context) {
    final forecasts = useQuery(
      ["forecasts"],
      () => getWeatherForecasts(locationData),
      refetchInterval: const Duration(minutes: 5),
      enabled: locationData != null,
    );

    final geoid = forecasts.data?.geoid ?? "";
    final observations = useQuery(
      ["observations", geoid],
      () => getWeatherObservations(geoid),
      refetchInterval: const Duration(minutes: 5),
      enabled: geoid.isNotEmpty,
    );

    return Builder(
      builder: (context) {
        if (observations.isLoading || forecasts.isLoading) {
          return Center(child: LoadingIndicator());
        }

        if (observations.isError || forecasts.isError) {
          return Center(child: ErrorMessage(message: "There was an error."));
        }

        return Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            Observations(
              temperature: observations.data,
              weatherSymbol:
                  forecasts.data?.forecasts.firstOrNull?.weatherSymbol,
            ),
            ForecastList(forecasts: forecasts.data?.forecasts),
            DailyForecast(forecasts: forecasts.data?.forecasts),
          ],
        );
      },
    );
  }
}
