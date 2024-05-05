import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
class APIProvider extends GetxService{
 ////
  late dio.Dio _dio;
//Dio getc()=>Dio()..httpClientAdapter=BrowserHttpClientAdapter(withCredentials: true);
  APIProvider(){
    _dio=dio.Dio(
      dio.BaseOptions(
        //  baseUrl: "https://reqres.in/api/",
        //  connectTimeout: Duration(seconds: 30),
     // 10 minutes in milliseconds
      //  extra: {"withCredentials":true},
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

      String method, Map<String,dynamic> queryParams,dynamic body,{String? head})async{
    // print(1);
    // DioForBrowser dioForBrowser = DioForBrowser(_dio.options);
    // print(2);
    // var adapter= BrowserHttpClientAdapter();
    // print(3);
    // adapter.withCredentials=true;
    // print(4);
    // _dio.httpClientAdapter=adapter;

    print(5);
    if (head!=null){
      _dio.options = dio.BaseOptions(headers: {'Cookie': head});}
    print(6);
    dio.Response response=await _dio.post(method,queryParameters: queryParams,data: body);
    print(7);
    if(response.statusCode==200){
     // getc();
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