import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_aplecerion/AppColors/app_colors.dart';
import 'package:wether_aplecerion/models/repository/five_days_weather_status_repo.dart';

import '../bloc/weather_bloc.dart';
  
class NextdaysStatus extends StatefulWidget {
  const NextdaysStatus({Key? key}) : super(key: key);

  @override
  State<NextdaysStatus> createState() => _NextdaysStatusState();
}
class _NextdaysStatusState extends State<NextdaysStatus> {
  @override
  Widget build(BuildContext context) {
    return    BlocConsumer<WeatherBloc, WeatherState>(
       listener: (context, state) {
        // Navigator.
       },
       builder: (context, state) {
        if (state is WeatherInitialState) {
          return buildLoading();
        }
        if (state is WeatherLoadingState) {
          return buildLoading();
        }
        if (state is NextFiveDaysWeatherLoadedState) {
          return buildNextFiveDaysWeth(state.nextFiveDaysWeathers);
        }
        if (state is WeatherErrorState) {
          return buildError(state.massage);
        }
        return Container(
          child: Text("lknjn"),
        );
      },
     );
  }

  Widget buildNextFiveDaysWeth(FiveDaysWeatherStasus nextFiveDaysWeathers){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "The Next 5 days",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    nextFiveDaysWeathers.city!.id.toString(),
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
                        color: AppColors.borderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child:  Center(
                      child: Column(children: [
                        Image.asset("assets/icons/ic_rain_snow.png",height: 30,width: 30),
                        const SizedBox(height: 8),
                        const Text("10 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ],),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Monday",
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
                        color: AppColors.borderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child:  Center(
                      child:Column(children: [
                        Image.asset("assets/icons/ic_lighting.png",height: 30,width: 30),
                        const SizedBox(height: 8),
                        const Text("8 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ],),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Tuesday",
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
                        color: AppColors.borderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child:  Center(
                      child: Column(children: [
                        Image.asset("assets/icons/ic_wint.png",height: 30,width: 30),
                        const SizedBox(height: 8),
                        const Text("3 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ],),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Thursday",
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
                        color: AppColors.borderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child:  Center(
                      child: Column(children: [
                        Image.asset("assets/icons/ic_thunder.png",height: 30,width: 30),
                        const SizedBox(height: 8),
                        const Text("5 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ],),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Friday",
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
                        color: AppColors.borderColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child:  Center(
                      child: Column(children: [
                        Image.asset("assets/icons/ic_cloude.png",height: 30,width: 30),
                        const SizedBox(height: 8),
                        const Text("9 C",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                      ],),
                    ),
                  ),
                ],
              )
            ]),
      ],
    );
  }

  Widget buildError(String error) {
    return Center(
        child: Text(
          error,
          style: const TextStyle(fontSize: 24),
        ));
  }
  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }


}
