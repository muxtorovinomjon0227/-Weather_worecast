import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_aplecerion/pages/build_weather_forecast.page.dart';
import 'package:wether_aplecerion/pages/home_page.dart';

import 'models/repositories/popular_repository.dart';
import 'models/services/movies_list_vm.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MoviesListViewModel()),
      ],
      child: MaterialApp(
        home: buildWeatherForecast(),
      ),
    );
  }
}
