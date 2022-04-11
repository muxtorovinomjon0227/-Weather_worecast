import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../models/repository/weather_api.dart';

class BuildTime extends StatefulWidget {
  const BuildTime({Key? key, weather}) : super(key: key);

  @override
  State<BuildTime> createState() => _BuildTimeState();
}

class _BuildTimeState extends State<BuildTime> {
  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(FetchCurrentWeatherEvent());

    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        // Navigator.
      },
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return builTime(state.weathers);
        }
        return Container(
          child: const Text("Weather App"),
        );
      },
    );
  }

  Widget builTime(MyWeather weathers) {
    return Column(
      children: [
        const Text(
          "2022 aprel 6",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          weathers.sys!.country.toString(),
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          weathers.name.toString(),
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),

      ],
    );
  }
}
