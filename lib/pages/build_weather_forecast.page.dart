import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/services/movies_list_vm.dart';

class buildWeatherForecast extends StatelessWidget {
  const buildWeatherForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provider.of<MoviesListViewModel>(context, listen: false).getFromApi();

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
                 Padding(
                  padding: EdgeInsets.only(top: 80,left: 40),
                  child: Column(children: [

                    Consumer<MoviesListViewModel>(builder: (context, data, child){
                      return ListView.builder(
                          itemCount: data.movies.length,
                          itemBuilder: (BuildContext context, int index){
                            return Text(data.movies[index].id.toString());
                          });
                    }),
                  ]),
                ),
              ],
            ),
          ],
        ),);
  }
}
