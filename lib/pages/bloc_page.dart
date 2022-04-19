import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_aplecerion/AppColors/app_colors.dart';

import '../bloc/next_five_weather_bloc/next_five_weather_bloc.dart';
import '../models/next_second_repo.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<NextFiveWeatherBloc>().add(FetchNextFiveWeatherEvent());

    return Container(
      height: 230,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
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

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildUI(FiveDaysWeatherStasus nextWeathers) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Next five days:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          ),
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
                                Image.asset("assets/icons/ic_lighting.png"),
                                // buildWeather(),
                                SizedBox(height: 8),
                                Text(
                                    nextWeathers.list![index].main!.temp
                                            .toString() +
                                        "°C",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nextWeathers.list![index].dtTxt!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Spid:" +
                                  " " +
                                  nextWeathers.list![index].wind!.speed
                                      .toString() +
                                  "m/s",
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text("visibility:"+" "+nextWeathers.list![index].visibility.toString() +" "+"miles",style: TextStyle(fontSize: 16)),
                            SizedBox(height: 8),
                            Text("humidity:"+" "+nextWeathers.list![index].main!.humidity.toString()+ " "+"%",style: TextStyle(fontSize: 16))

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),],
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
}
