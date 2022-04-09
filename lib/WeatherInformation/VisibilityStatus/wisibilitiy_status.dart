import 'package:flutter/material.dart';
import 'package:wether_aplecerion/models/repository/news_api.dart';

class WisibilitiyStatus extends StatefulWidget {
  final MyWeather weathers;
  const WisibilitiyStatus(this.weathers,{Key? key}) : super(key: key);

  @override
  State<WisibilitiyStatus> createState() => _WisibilitiyStatusState();
}

class _WisibilitiyStatusState extends State<WisibilitiyStatus> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const Text(
          "Visibility",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Text(
           widget.weathers.visibility.toString()+" miles",
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
        ),

      ],
    );
  }
}
