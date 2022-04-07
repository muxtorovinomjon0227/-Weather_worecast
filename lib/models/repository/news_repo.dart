import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_api.dart';


abstract class NewRepository{

  Future<List<Weather>> getNews();
}
class NewRepositoryImp implements NewRepository{
  @override
  Future<List<Weather>> getNews() async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=Toshkent&appid=66c58a5fb4a2eb3fc3f86571aad23307&units=metric'));
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      List<Weather> weathers = News.fromJson(data).articles!;
      return weathers;
    }else{
      throw Exception( );
    }


  }

}



