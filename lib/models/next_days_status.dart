import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_aplecerion/AppColors/app_colors.dart';
import 'package:wether_aplecerion/models/repository/five_days_weather_status_repo.dart';

import '../bloc/next_five_weather_bloc/next_five_weather_bloc.dart';


class NextdaysStatus extends StatefulWidget {
  const NextdaysStatus({Key? key}) : super(key: key);

  @override
  State<NextdaysStatus> createState() => _NextdaysStatusState();
}
class _NextdaysStatusState extends State<NextdaysStatus> {
  @override
  Widget build(BuildContext context) {
    context.read<NextFiveWeatherBloc>().add(FetchNextFiveWeatherEvent());
    return    BlocConsumer<NextFiveWeatherBloc,NextFiveWeatherState>(
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
        return const Text("Nimadir xato",style: TextStyle(fontSize: 35));
      },
     );
  }


  Widget buildUI(FiveDaysWeatherStasus nextWeathers) {
    return ListView.builder(
        itemCount: nextWeathers.list!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              children: [
                Text(
                  index.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      fontSize: 20),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    nextWeathers.city!.name.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildNextFiveDaysWeth(FiveDaysWeatherStasus nextWeathers ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            nextWeathers.city!.name.toString(),
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
                    nextWeathers.city!.id.toString(),
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
