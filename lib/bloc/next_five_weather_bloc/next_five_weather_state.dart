part of 'next_five_weather_bloc.dart';

@immutable
abstract class NextFiveWeatherState extends Equatable{}

class NextFiveWeatherInitialState extends NextFiveWeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class NextFiveWeatherLoadingState extends NextFiveWeatherState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class NextFiveWeatherLoadedState extends NextFiveWeatherState{
  @override
  FiveDaysWeatherStasus  nextWeathers;
  NextFiveWeatherLoadedState(this.nextWeathers);

  @override
  // TODO: implement props
  List<Object?> get props => [nextWeathers];


}
class  NextFiveWeatherErrorState extends NextFiveWeatherState{
  @override
  String message;
  NextFiveWeatherErrorState(this.message);
  List<Object?> get props => throw NextFiveWeatherErrorState(message);

}