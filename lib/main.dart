import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import "weather.dart";

void main() {
  runApp(QueryClientProvider(queryClient: QueryClient(), child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const Weather(),
    );
  }
}
