import 'dart:convert';
import '../api_model.dart';
import 'package:http/http.dart' as http;


abstract class NewRepository{

  Future<List<Weather>> getNews();
}
class NewRepositoryImp implements NewRepository{
  @override
  Future<List<Weather>> getNews() async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=Tashkent&cnt=5&appid=baf82b9931f7e32b4dbc1bafa09f1e99'));
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      List<Weather> weathers = Weather.fromJson(data) as List<Weather>;
      return weathers;
    }else{
      throw Exception();
    }


  }

}



