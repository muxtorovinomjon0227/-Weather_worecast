import 'package:flutter/material.dart';

import '../../models/weather_api.dart';

class WindStatus extends StatefulWidget {
  final MyWeather weathers;
  const WindStatus(this.weathers,{Key? key}) : super(key: key);

  @override
  State<WindStatus> createState() => _WindStatusState();
}

class _WindStatusState extends State<WindStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const Text(
          "Wind status",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Text(
          widget.weathers.wind!.speed.toString()+" m/s",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
        ),

      ],
    );
  }
}
