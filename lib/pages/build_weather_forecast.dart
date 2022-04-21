import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wether_aplecerion/models/weather_api.dart';

class TemperatureCard extends StatefulWidget {
  final MyWeather weathers;

  const TemperatureCard(this.weathers, {Key? key}) : super(key: key);

  @override
  State<TemperatureCard> createState() => _TemperatureCardState();
}

class _TemperatureCardState extends State<TemperatureCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: <Widget>[
              Image.asset("assets/images/image_ellipse.png",
                  height: 280, width: 310),
              Padding(
                padding: const EdgeInsets.only( left:68),
                child: Column(
                  children: [
                    Image.network(
                        "http://openweathermap.org/img/w/" +
                            widget.weathers.weather!.last.icon.toString() +
                            ".png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                        ),
                    Text(
                      widget.weathers.main!.feelsLike.toString() + "°C",
                      style: const TextStyle(fontSize: 50, color: Colors.blue),
                    ),
                    Text(
                      widget.weathers.weather![0].main.toString(),
                      style: const TextStyle(fontSize: 25, color: Colors.amberAccent),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
