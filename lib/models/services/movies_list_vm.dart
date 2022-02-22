import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:wether_aplecerion/models/weather.dart';
import 'package:http/http.dart'as http;





class MoviesListViewModel extends ChangeNotifier{

  final String _apiUrl = 'http://api.openweathermap.org/data/2.5/weather?';
   final String _q = 'q=tashkent';
   final String _apiKey = '&appid=6586eb96f640f4b3a3181ffd0f38a3c4';
  final String _country = '&units=metric';


 List<Movie> _movies = [];

List<Movie> get movies {
  return _movies;
}

Future<void > getFromApi() async {
  var uri =" $_apiUrl$_q$_apiKey$_country";

  var url=Uri.parse(uri);
  final response= await http.get(url);

  final request =jsonDecode(response.body)['weather'] as  List;

  _movies = request.map((e) => Movie.fromJson(e)).toList();

  notifyListeners();
}


}
