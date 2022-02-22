

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/movies_list_vm.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {

    Provider.of<MoviesListViewModel>(context, listen: false).getFromApi();


    return Scaffold(
      body: Column(children: [
        Center(child: Text("pkijo",style: TextStyle(fontSize: 45),)),
        Consumer<MoviesListViewModel>(builder: (context, data, child){
          return ListView.builder(
              itemCount: data.movies.length,
              itemBuilder: (BuildContext context, int index){
                return Text(data.movies[index].clouds.toString());
              });
        }),
      ]),
    );
  }
}



