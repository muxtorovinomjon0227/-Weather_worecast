import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../WeatherInformation/AirPressureStatus/air_pressur_status.dart';
import '../WeatherInformation/HumidityStatus/humidity_status.dart';
import '../WeatherInformation/VisibilityStatus/wisibilitiy_status.dart';
import '../WeatherInformation/WindStatus/wind_status.dart';
import '../details/Search/search_page.dart';
import '../models/rectangle_page.dart';
import 'build_Time_page.dart';
import 'build_weather_forecast.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      iconSize: 40,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SearchPage()),
                        );
                        setState(() {
                        });
                      },
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Center(child: BuildTime()),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Center(child: BuildWeatherForecast()),
                ),

                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 380),
                      child: Column(children: const [
                        WindStatus(),
                        SizedBox(height: 30,),
                        HumidityStatus()
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 380),
                      child: Column(children: const [
                        WisibilitiyStatus(),
                        SizedBox(height: 30),
                        AirPressurStatus()
                      ]),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 500),
                  child: NextDaysStatus(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
