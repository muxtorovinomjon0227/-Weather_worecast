import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wether_aplecerion/models/repository/five_days_weather_status_repo.dart';

import '../../models/repository/next_repo.dart';

part 'next_five_weather_event.dart';
part 'next_five_weather_state.dart';

class NextFiveWeatherBloc extends Bloc<NextFiveWeatherEvent, NextFiveWeatherState> {
  NextFiveRepository nextRepository;
  NextFiveWeatherBloc(this.nextRepository) : super(NextFiveWeatherInitialState()) {
    on<FetchNextFiveWeatherEvent>((event, emit) async {
      try{
        FiveDaysWeatherStasus nextWeathers = await nextRepository.getNextWeather();
        emit(NextFiveWeatherLoadedState(nextWeathers));
      }catch(e){
        emit(NextFiveWeatherErrorState(e.toString()));
      }
    });
  }
}
