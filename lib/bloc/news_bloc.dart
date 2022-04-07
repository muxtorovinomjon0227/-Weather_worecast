import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wether_aplecerion/models/repository/news_repo.dart';

import '../models/repository/news_api.dart';
part 'news_event.dart';
part 'news_state.dart';



class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewRepository repository;

  NewsBloc(this.repository) : super(NewsInitialState()) {
    on<FetchNewsEvent>(
      (event, emit) async {
        try {
          List<Weather> weathers = await repository.getNews();
          emit(NewsLoadedState(weathers));
        } catch (e) {
          // emit(NewsErrorState(e.toString()));
        }
      },
    );
  }
}
