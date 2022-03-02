import 'package:flutter/cupertino.dart';

class buildWeatherForecast extends StatelessWidget {
  const buildWeatherForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Container(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Image.asset("assets/images/image_ellipse.png",
                    height: 280, width: 280),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 100),
                  child: Image.asset(
                    "assets/icons/icon_rain.png",
                    height: 75,
                    width: 75,
                  ),
                ),
              ],
            ),
          ],
        ),);
  }
}
