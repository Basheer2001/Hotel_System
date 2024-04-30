import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
class APIProvider extends GetxService{
 ////
  late dio.Dio _dio;

  APIProvider(){
    _dio=dio.Dio(
      dio.BaseOptions(
        //  baseUrl: "https://reqres.in/api/",
        //  connectTimeout: Duration(seconds: 30),
          validateStatus: (status){
            return true;
          }
      ),
    );

  }

  Future<dio.Response> getRequest(String method, Map<String,dynamic> queryParams)async{
    dio.Response response=await _dio.get(method,queryParameters: queryParams);
    if(response.statusCode==200){
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }
  }

  Future<dio.Response> postRequest(
      String method, Map<String,dynamic> queryParams,dynamic body)async{
    dio.Response response=await _dio.post(method,queryParameters: queryParams,data: body);
    if(response.statusCode==200){
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }
  }

  Future<dio.Response> putRequest(
      String method, Map<String,dynamic> queryParams)async{
    dio.Response response=await _dio.put(method,queryParameters: queryParams);
    if(response.statusCode==200){
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }
  }

}