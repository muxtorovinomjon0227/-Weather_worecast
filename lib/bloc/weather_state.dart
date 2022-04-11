part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable{}

class WeatherInitialState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewsLoadingState extends WeatherState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class WeatherLoadedState extends  WeatherState{
  MyWeather weathers;
  WeatherLoadedState(this.weathers) {
    // TODO: implement NextWeatherLoadedState
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NextFiveDaysWeatherLoadedState extends WeatherState{
  FiveDaysWeatherStasus  nextFiveDaysWeathers;
  NextFiveDaysWeatherLoadedState(this.nextFiveDaysWeathers) {
    // TODO: implement NextWeatherLoadedState
    throw UnimplementedError();
  }


  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}



class NewsErrorState extends WeatherState{
String massage;
NewsErrorState(this.massage);

  @override

  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}