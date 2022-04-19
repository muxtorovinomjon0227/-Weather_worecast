import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/weather_bloc.dart';
import '../models/weather_api.dart';

class BuildTime extends StatefulWidget {
  const BuildTime({Key? key, weather}) : super(key: key);

  @override
  State<BuildTime> createState() => _BuildTimeState();
}

class _BuildTimeState extends State<BuildTime> {
  String get formattedDate => DateFormat('MM/dd/yyyy, hh:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    context.read<WeatherBloc>().add(FetchCurrentWeatherEvent());

    return BlocConsumer<WeatherBloc, WeatherState>(
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
          return builTime(state.weathers);
        }
        if (state is WeatherErrorState) {
          return buildError(state.massage);
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
         Text(
           formattedDate,
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
  void main() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE d MMM - kk:mm:ss').format(now);
    print(formattedDate);
  }

}
