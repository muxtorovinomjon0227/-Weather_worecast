import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../WeatherInformation/AirPressureStatus/air_pressur_status.dart';
import '../WeatherInformation/HumidityStatus/humidity_status.dart';
import '../WeatherInformation/VisibilityStatus/wisibilitiy_status.dart';
import '../WeatherInformation/WindStatus/wind_status.dart';
import '../bloc/weather_bloc.dart';
import '../details/Search/search_page.dart';
import '../models/weather_api.dart';
import 'bloc_page.dart';
import 'build_Time_page.dart';
import 'build_weather_forecast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(FetchCurrentWeatherEvent("Tashkent"));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        // Navigator.
      },
      builder: (context, state) {
        if (state is WeatherInitialState) {
          return buildLoading();
        }
        if (state is WeatherLoadingState) {
          return buildLoading();
        }
        if (state is WeatherLoadedState) {
          return buildUi(state.weathers);
        }
        if (state is WeatherErrorState) {
          return buildError(state.massage);
        }
        return Container(
         child: const Text("Weather App"),
        );
      },
    ));
  }

  Widget buildUi(MyWeather weathers) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
          image: AssetImage("assets/images/background_image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25,right: 10),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      iconSize: 40,
                      onPressed: () {
                        showSearch();
                      },
                    ),
                  ),
                ],
              ),
              Center(child: BuildTime(weathers)),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Center(child: TemperatureCard(weathers)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 330),
                    child: Column(children:  [
                      WindStatus(weathers),
                      SizedBox(
                        height: 30,
                      ),
                      HumidityStatus(weathers)
                    ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 330),
                    child: Column(children:  [
                      WisibilitiyStatus(weathers),
                      SizedBox(height: 30),
                      AirPressurStatus(weathers),
                    ]),
                  ),
                ],
              ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  const [
                   SizedBox(height:500),
                   FiveWeatherPage(),
                 ],
               ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildError(String error) {
    return Center(
        child: Text(
      error,
      style: const TextStyle(fontSize: 24),
    ));
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }
  void showSearch() async {
    final res = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SearchPage2()),
    );
    context.read<WeatherBloc>().add(FetchCurrentWeatherEvent(res));


  }
}
