import 'dart:convert';
import 'package:http/http.dart' as http;
import '../weather_api.dart';

abstract class WeatherRepository {
  Future<MyWeather> getWeather(String city);
}
class NewRepositoryImp implements WeatherRepository {
  @override
  Future<MyWeather> getWeather(String city) async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=66c58a5fb4a2eb3fc3f86571aad23307&units=metric'));
    if (response.statusCode == 200) {
      var dynamic = json.decode(response.body);
      MyWeather weathers = MyWeather.fromJson(dynamic);
      return weathers;
    } else {
      throw Exception();
    }
  }

}
