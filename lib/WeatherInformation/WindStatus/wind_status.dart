import 'package:flutter/material.dart';

class WindStatus extends StatelessWidget {
  const WindStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          Text(
            "Wind status",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          Text(
            "7 mph",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
          ),

        ],
      ),
    );
  }
}
