import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_bloc.dart';
import '../models/repository/news_api.dart';

class BuildTime extends StatefulWidget {
  const BuildTime({Key? key,weather
  }) : super(key: key);

  @override
  State<BuildTime> createState() => _BuildTimeState();
}
class _BuildTimeState extends State<BuildTime> {
  @override


  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(FetchNewsEvent());

    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state ) {
        // Navigator.
      },
      builder: (context, state) {
        if (state is NewsLoadedState  ) {
          return builTime(state.weathers);
        }
        return Container(
          child: const Text("Weather App"),
        );
      },
    );
  }



  Widget builTime(List<Weather> weathers){
    return Column(
      children:   [
        Text(weathers[0].main.toString(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
        ),
        SizedBox(height: 8),
        Text(
          weathers[0].description.toString(),
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 15),
      ],
    );
  }

}



