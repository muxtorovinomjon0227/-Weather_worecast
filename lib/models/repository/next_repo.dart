import 'dart:convert';

import 'package:http/http.dart' as http;

import 'next_second_repo.dart';

abstract class NextFiveRepository {
  Future<FiveDaysWeatherStasus> getNextWeather();
}

class NextFiveRepositoryImpl implements NextFiveRepository {
  @override
  Future<FiveDaysWeatherStasus> getNextWeather() async{
    var response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/forecast?q=Tashkent&appid=66c58a5fb4a2eb3fc3f86571aad23307&units=metric"));
    if(response.statusCode==200){
      var data = json.decode(response.body);
      FiveDaysWeatherStasus nextWeathers = FiveDaysWeatherStasus.fromJson(data);
      return nextWeathers;
    }else{
      throw Exception();
    }
  }
}