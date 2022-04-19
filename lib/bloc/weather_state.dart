part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable{
}

class WeatherInitialState extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw WeatherInitialState();
}

class WeatherLoadingState extends WeatherState{
  @override
  // TODO: implement props
  List<Object?> get props => throw WeatherLoadingState();
}

class WeatherLoadedState extends  WeatherState{
  MyWeather weathers;
  WeatherLoadedState(this.weathers);

  @override
  // TODO: implement props
  List<Object?> get props => throw WeatherLoadedState(weathers);
}

class WeatherErrorState extends WeatherState{
String massage;
WeatherErrorState(this.massage);

  @override

  // TODO: implement props
  List<Object?> get props => throw WeatherErrorState(massage);
}