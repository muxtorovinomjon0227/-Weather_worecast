import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wether_aplecerion/models/repository/news_repo.dart';

import '../models/repository/five_days_weather_status_repo.dart';
import '../models/repository/news_api.dart';
part 'news_event.dart';
part 'news_state.dart';



class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository repository;

  WeatherBloc(this.repository) : super(WeatherInitialState()) {
    on<FetchCurrentWeatherEvent>(
      (event, emit) async {
        try {
          MyWeather weathers = await repository.getWeather();
          emit(WeatherLoadedState(weathers));
        } catch (e) {
          emit(NewsErrorState(e.toString()));
        }
      },
    );
    on<FetchNextFiveWeatherEvent>(
          (event, emit) async {
        try {
          FiveDaysWeatherStasus nextFiveDaysWeathers = await repository.getNextFiveDaysWeather();
          emit(NextFiveDaysWeatherLoadedState(nextFiveDaysWeathers));
        } catch (e) {
          emit(NewsErrorState(e.toString()));
        }
      },
    );
  }
}
