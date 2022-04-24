import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_aplecerion/AppColors/app_colors.dart';
import '../bloc/next_five_weather_bloc/next_five_weather_bloc.dart';
import '../models/next_second_repo.dart';

class FiveWeatherPage extends StatefulWidget {
  const FiveWeatherPage({Key? key}) : super(key: key);

  @override
  State<FiveWeatherPage> createState() => _FiveWeatherPageState();
}

class _FiveWeatherPageState extends State<FiveWeatherPage> {
  @override
  void initState() {
    super.initState();
    context.read<NextFiveWeatherBloc>().add(FetchNextFiveWeatherEvent("Toshkent"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: BlocConsumer<NextFiveWeatherBloc, NextFiveWeatherState>(
        listener: (context, state) {
          // Navigator.
        },
        builder: (context, state) {
          if (state is NextFiveWeatherInitialState) {
            return buildLoading();
          }
          if (state is NextFiveWeatherLoadingState) {
            return buildLoading();
          }
          if (state is NextFiveWeatherLoadedState) {
            return buildUI(state.nextWeathers);
          }
          if (state is NextFiveWeatherErrorState) {
            return buildError(state.message);
          }
          return Container(
              child: Text("Nimadir xato", style: TextStyle(fontSize: 35)));
        },
      ),
    );
  }



  Widget buildUI(FiveDaysWeatherStasus nextWeathers) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
      child: Stack(
        children: [
          ListView.builder(
              itemCount: nextWeathers.list!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: AppColors.borderColor,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            height: 110,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColors.borderColor,
                                width: 3,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Image.network(
                                    "http://openweathermap.org/img/w/" +
                                        nextWeathers
                                            .list![index].weather![0].icon
                                            .toString() +
                                        ".png",
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  // buildWeather(),
                                  SizedBox(height: 1),
                                  Text(
                                      nextWeathers.list![index].main!.temp
                                              .toString() +
                                          "°C",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      nextWeathers.list![index].weather![0].main
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffC04000))),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getData(nextWeathers, index),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.blue),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Speed:" +
                                    " " +
                                    nextWeathers.list![index].wind!.speed
                                        .toString() +
                                    "m/s",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                  "Pop:" +
                                      " " +
                                      nextWeathers.list![index].pop.toString() +
                                      " " +
                                      "%",
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(height: 8),
                              Text(
                                  "Humidity:" +
                                      " " +
                                      nextWeathers.list![index].main!.humidity
                                          .toString() +
                                      " " +
                                      "%",
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget buildError(String error) {
    return Center(
        child: Text(
      error,
      style: const TextStyle(fontSize: 24),
    ));
  }

  Widget buildWeather(List<Weather> nextWeathers) {
    return ListView.builder(
      physics: BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
        itemCount: nextWeathers.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "http://openweathermap.org/img/w/" +
                nextWeathers[index].icon.toString() +
                ".png",
            width: 40,
            height: 40,
          );
        });
  }

  String getData(FiveDaysWeatherStasus nextWeathers, int index) {
    String data = nextWeathers.list![index].dtTxt.toString();
    // String yera = data.substring(0, 4);
    String moth = gerMoth(data.substring(5,7));
    String day = data.substring(8,10);
    String wath = data.substring(11,16);
    return  day +"-"+moth+" "+wath;
  }

  String gerMoth(String index) {
    switch (index) {
      case '01':
        {
          return "Junuary";
        }
      case '02':
        {
          return "Fevral";
        }
      case '03':
        {
          return "March";
        }
      case '04':
        {
          return "Aprel";
        }
      case '05':
        {
          return "May";
        }
      case '06':
        {
          return "Iyun";
        }
      case '07':
        {
          return "Iyul";
        }
      case '08':
        {
          return "Avgust";
        }
      case '09':
        {
          return "Sentyabr";
        }
      case '10':
        {
          return "Oktyabr";
        }
      case '11':
        {
          return "Noyabr";
        }
      case '12':
        {
          return "Dekabr";
        }
    }
    return index;

  }
  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}
