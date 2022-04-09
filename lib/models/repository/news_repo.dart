import 'dart:convert';
import 'package:http/http.dart' as http;
import 'five_days_weather_status_repo.dart';
import 'news_api.dart';

abstract class WeatherRepository {
  Future<MyWeather> getWeather();
  Future<FiveDaysWeatherStasus> getNextFiveDaysWeather();
}

class NewRepositoryImp implements WeatherRepository {
  @override
  Future<MyWeather> getWeather() async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Tashkent&appid=66c58a5fb4a2eb3fc3f86571aad23307&units=metric'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      MyWeather weathers = MyWeather.fromJson(data);
      return weathers;
    } else {
      throw Exception();
    }
  }

  @override
  Future<FiveDaysWeatherStasus> getNextFiveDaysWeather() async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=Tashkent&appid=66c58a5fb4a2eb3fc3f86571aad23307&units=metric'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      FiveDaysWeatherStasus nextFiveDaysWeathers = FiveDaysWeatherStasus.fromJson(data);
      return nextFiveDaysWeathers;
    } else {
      throw Exception();
    }
  }
}
