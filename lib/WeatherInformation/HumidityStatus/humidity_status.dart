import 'package:flutter/material.dart';
import 'package:wether_aplecerion/models/repository/weather_api.dart';
class HumidityStatus extends StatefulWidget {
  final MyWeather weathers;
  const HumidityStatus(this.weathers,{Key? key}) : super(key: key);

  @override
  State<HumidityStatus> createState() => _HumidityStatusState();
}

class _HumidityStatusState extends State<HumidityStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const Text(
          "Humidity",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Text(
          widget.weathers.main!.humidity.toString() + " %",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
        ),

      ],
    );
  }
}
