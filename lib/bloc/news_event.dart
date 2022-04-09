part of 'news_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable{

}
class FetchCurrentWeatherEvent extends WeatherEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class FetchNextFiveWeatherEvent extends WeatherEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

