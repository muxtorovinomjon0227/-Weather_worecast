import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_aplecerion/models/repository/weather_repo.dart';
import 'package:wether_aplecerion/pages/home_page.dart';
import 'bloc/next_five_weather_bloc/next_five_weather_bloc.dart';
import 'bloc/weather_bloc.dart';
import 'models/repository/next_repo.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
   runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Manrope"),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => WeatherBloc(NewRepositoryImp()),
          ),
          BlocProvider(
            create: (_) => NextFiveWeatherBloc(NextFiveRepositoryImpl()),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
