part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable{

}
class FetchCurrentWeatherEvent extends WeatherEvent{
  String city;
  FetchCurrentWeatherEvent(this.city);

  @override
  // TODO: implement props
  List<Object?> get props => throw FetchCurrentWeatherEvent(city);

}

class FetchNextFiveWeatherEvent extends WeatherEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw FetchNextFiveWeatherEvent();

}
