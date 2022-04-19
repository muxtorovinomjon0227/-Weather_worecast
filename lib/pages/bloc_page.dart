import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/next_five_weather_bloc/next_five_weather_bloc.dart';
import '../models/repository/next_second_repo.dart';

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
      height: 200,
      width: double.infinity,
      child:BlocConsumer<NextFiveWeatherBloc, NextFiveWeatherState>(
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
    return ListView.builder(
        itemCount: nextWeathers.list!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: [
                Text(
                  nextWeathers.list![index].dtTxt!,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 100,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 3,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Image.network(
                          "http://openweathermap.org/img/w/" +
                               nextWeathers.list![index].weather![index].icon.toString()+".png",
                          width: 40,
                          height: 40,
                        ),
                         SizedBox(height: 8),
                         Text(nextWeathers.list![index].main!.temp.toString()+"°C",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildError(String error) {
    return Center(
        child: Text(
          error,
          style: const TextStyle(fontSize: 24),
        ));
  }

}