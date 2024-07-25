import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/countrymodel.dart';
import '../models/weatherdata_model.dart';

class APIHelper{


  Future<WeatherDataModel?> getWeatherDataForMyLocation(
      double lat,double lon) async{
    http.Response response =await http.get(Uri.parse(
        "http://api.openWeathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=498d839a85026b40ac764c50e88288cd"));

    if (response.statusCode==200){
      return WeatherDataModel.formJson(jsonDecode(response.body));
    }else{
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }


  Future<WeatherDataModel?> getWeatherDataForCityName(String name) async{
    http.Response response= await http.get(Uri.parse(
        "http://api.openWeathermap.org/data/2.5/weather?q=$name&appid=498d839a85026b40ac764c50e88288cd"));

    if(response.statusCode==200){
      return WeatherDataModel.formJson(jsonDecode(response.body));
    }
    else{
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }


  Future<List<CountryModel>> getCountryList() async{
    http.Response response=await http.get(Uri.parse("https://restCountries.com/v3.1/all"));
    if(response.statusCode==200){
      return CountryModel.fromJsonArray(jsonDecode(response.body));
    }else{
      print(response.statusCode);
      print(response.body);
      return<CountryModel>[];
    }
  }
}

