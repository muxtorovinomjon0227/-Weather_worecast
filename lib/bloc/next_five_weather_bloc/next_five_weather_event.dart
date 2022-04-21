part of 'next_five_weather_bloc.dart';

@immutable
abstract class NextFiveWeatherEvent extends Equatable {}

class FetchNextFiveWeatherEvent extends NextFiveWeatherEvent{
  String city;
  FetchNextFiveWeatherEvent(this.city);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class FetchSportNextFiveWeatherEvent extends NextFiveWeatherEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
