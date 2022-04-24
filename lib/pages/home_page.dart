import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../WeatherInformation/AirPressureStatus/air_pressur_status.dart';
import '../WeatherInformation/HumidityStatus/humidity_status.dart';
import '../WeatherInformation/VisibilityStatus/wisibilitiy_status.dart';
import '../WeatherInformation/WindStatus/wind_status.dart';
import '../bloc/next_five_weather_bloc/next_five_weather_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../models/weather_api.dart';
import 'Search/search_page.dart';
import 'five_weathet_page.dart';
import 'build_Time_page.dart';
import 'build_weather_forecast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

String newCity = "Tashkent";

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(FetchCurrentWeatherEvent(newCity));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Colors.white,
      color: Colors.black,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        fetchData();
        await Future.delayed(Duration(microseconds: 1500));
      },
      child: Scaffold(
        backgroundColor: Color(0xff3EB489),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(
            ),
          ),
          child: BlocConsumer<WeatherBloc, WeatherState>(
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
          ),
        ),
      ),
    );
  }

  Widget buildUi(MyWeather weathers) {
    return Container(
      decoration: const BoxDecoration(
        color:  Color(0xff3EB489),
        // image: DecorationImage(
        //   image: AssetImage("assets/images/background_image.png"),
        //   fit: BoxFit.cover,
        // ),
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
                    padding: const EdgeInsets.only(right: 10, top: 30),
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
                    padding: const EdgeInsets.only(top: 350),
                    child: Column(
                      children: [
                        WindStatus(weathers),
                        SizedBox(
                          height: 30,
                        ),
                        HumidityStatus(weathers)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 350),
                    child: Column(children: [
                      WisibilitiyStatus(weathers),
                      SizedBox(height: 30),
                      AirPressurStatus(weathers),
                    ]),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 500),
                  Center(
                      child: Text(
                    "Next five days",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
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
     newCity = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage2()),
    );
    fetchData();
  }

  void fetchData() {
    context.read<WeatherBloc>().add(FetchCurrentWeatherEvent(newCity));
    context.read<NextFiveWeatherBloc>().add(FetchNextFiveWeatherEvent(newCity));
  }
}
