import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_aplecerion/models/api_model.dart';

import 'news_bloc.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(FetchNewsEvent());

    return Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: BlocConsumer<NewsBloc, NewsState>(
          listener: (context, state) {
            // Navigator.
          },
          builder: (context, state) {
            if (state is NewsInitialState) {
              return buildLoading();
            }
            if (state is NewsLoadingState) {
              return buildLoading();
            }
            if (state is NewsLoadedState) {
              return buildUI(state.weathers);
            }
            if (state is NewsErrorState) {
              return buildError(state.massage);
            }

            return Container();
          },
        ));
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildUI(List<Weather> weathers ) {
    return ListView.builder(
        itemCount: weathers.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              children: [
                Text(
                  index.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                      fontSize: 20),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    weathers[index].id.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget buildError(String error) {
    return Center(
        child: Text(
          error,
          style: const TextStyle(fontSize: 24),
        ));
  }
}