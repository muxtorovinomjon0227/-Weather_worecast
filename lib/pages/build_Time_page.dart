import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/weather_bloc.dart';
import '../models/weather_api.dart';

class BuildTime extends StatefulWidget {
  MyWeather weathers;
   BuildTime( this.weathers, {Key? key, weather}) : super(key: key);

  @override
  State<BuildTime> createState() => _BuildTimeState();
}

class _BuildTimeState extends State<BuildTime> {
  String get formattedDate => DateFormat('MM/dd/yyyy, hh:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {

    return builTime(widget.weathers);
  }

  Widget builTime(MyWeather weathers) {
    return Column(
      children: [
        SizedBox(height: 20),
         Text(
           formattedDate,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
        ),
        Text(
          weathers.sys!.country.toString(),
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
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


}
