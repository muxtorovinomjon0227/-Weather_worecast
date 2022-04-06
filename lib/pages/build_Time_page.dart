import 'package:flutter/material.dart';

class BuildTime extends StatefulWidget {
  const BuildTime({Key? key,weather
  }) : super(key: key);

  @override
  State<BuildTime> createState() => _BuildTimeState();
}
class _BuildTimeState extends State<BuildTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  const [
        Text(
          "Today, Fev, 19th, 2022",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
        ),
        SizedBox(height: 8),
        Text(
          "Uzbekistan",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}



