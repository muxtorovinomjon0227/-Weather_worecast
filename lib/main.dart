import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_aplecerion/models/repository/weather_repo.dart';
import 'package:wether_aplecerion/pages/home_page.dart';
import 'bloc/weather_bloc.dart';

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
    return MaterialApp(
      home: BlocProvider(
        create: (_) => WeatherBloc(NewRepositoryImp()),
        child: const HomePage(),
      ),
    );
  }
}

