import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wether_aplecerion/models/repository/weather_repo.dart';
import '../models/repository/weather_api.dart';
part 'weather_event.dart';
part 'weather_state.dart';



class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository repository;

  WeatherBloc(this.repository) : super(WeatherInitialState()) {
    on<FetchCurrentWeatherEvent>((event, emit) async {
        try {
          MyWeather weathers = await repository.getWeather();
          emit(WeatherLoadedState(weathers));
        } catch (e) {
          emit(WeatherErrorState(e.toString()));
        }
      },
    );
  }
}
