part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable{}

class NewsInitialState extends NewsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class NewsLoadingState extends NewsState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class NewsLoadedState extends NewsState{

  List<Weather> weathers;
  NewsLoadedState(this.weathers);



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class NewsErrorState extends NewsState{
String massage;
NewsErrorState(this.massage);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}