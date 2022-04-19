import 'package:flutter/material.dart';
import 'package:wether_aplecerion/models/weather_api.dart';
class AirPressurStatus extends StatefulWidget {
  final MyWeather weathers;
  const AirPressurStatus(this.weathers,{Key? key}) : super(key: key);

  @override
  State<AirPressurStatus> createState() => _AirPressurStatusState();
}

class _AirPressurStatusState extends State<AirPressurStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const Text(
          "Air pressure",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Text(
          widget.weathers.main!.pressure.toString()+" mb",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
        ),

      ],
    );
  }
}
