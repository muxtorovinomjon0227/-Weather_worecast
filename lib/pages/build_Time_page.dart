import 'package:flutter/material.dart';

class buildTime extends StatelessWidget {
  const buildTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
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
        Text(
          "Tashkent",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
        )
      ],
    );
  }
}



