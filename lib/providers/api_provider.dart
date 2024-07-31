import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Services.dart';

class APIProvider extends GetxService {
  ////

  static String url = "http://192.168.1.110:8000/api/";
  static String? token;
//static String url = "http://127.0.0.1:8000/api/";
//static String url = "http://192.168.1.4:8000/api/";

  late dio.Dio _dio;
  static List<String>? cookies;

  // Getter for the token
//Dio getc()=>Dio()..httpClientAdapter=BrowserHttpClientAdapter(withCredentials: true);
  APIProvider() {
    _dio = dio.Dio(
      dio.BaseOptions(
          //  baseUrl: "https://reqres.in/api/",
          //  connectTimeout: Duration(seconds: 30),
          // 10 minutes in milliseconds
          //  extra: {"withCredentials":true},
          validateStatus: (status) {
        return true;
        //  return status!=null && status>=200 && status<300;
      }),
    );
  }

  //Future<http.Response>postRequest(
  Future postRequest(
      String method, Map<String, dynamic> queryParams, dynamic body,
      {String? cookies, String? token}) async {
    SharedPreferences pref =  await SharedPreferences.getInstance();

    // print(1);
    // DioForBrowser dioForBrowser = DioForBrowser(_dio.options);
    // print(2);
    // var adapter= BrowserHttpClientAdapter();
    // print(3);
    // adapter.withCredentials=true;
    // print(4);
    // _dio.httpClientAdapter=adapter;

    print(5);
    // if (cookies != null || token != null) {
    //   _dio.options = dio.BaseOptions(
    //       headers: {
    //     'Cookie': cookies ?? cookies,
    //     'Authorization': token ?? 'Bearer ${token}'
    //   });
    // }
    print(6);
    // dio.Response response =
    //     await _dio.post(
    //          method,
    //          queryParameters: queryParams,
    //
    //         data: body
    //
    //     );
    http.Response response0 = await http.post(
        Uri.parse(
          //'http://192.168.1.110:8000/api/login'
            //'http://192.168.1.110:8000/api/user/profile'
          method
          // "${APIProvider.url}user/profile",
        ),
         headers:
      // {
        //   'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGY0MjcyZTI1ZWRmMGEyYzMyNDViMDM2ZTE4ZWZiN2UwYmI4MzYxMzZkOThkMWYxZmFhN2EzM2NlZTBmNzg0MDYwNjM3ZWY1YzRjNWM0OGIiLCJpYXQiOjE3MjI0MzY2NzMuMjIzNTc2LCJuYmYiOjE3MjI0MzY2NzMuMjIzNTgxLCJleHAiOjE3NTM5NzI2NzMuMTg3NjE3LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.kYdwWqd5Fy1G3OUFmylzzfGLOuGzi-U7yStxlqO90MZ-kM4SG0ejqXG7a4EurCU46s33-X_y3OmPZJ_Vk3bAy6HaPc71uWYT_mx59G92WMp8gp7cgTtS9M9A4T_9N6acZz1GA1NY2KpPpYKhKGssN_vLJvvi5SR8gd34UuXv6WqsJYmW3796yOnAVn-_2N3hoGoWm9cOQjNizQ5HQ7Ul452opmyenX-Vit8_ZoAmIQdGTX5qFdPK4er1cD9yrr5CeSFHC1NMjAEeRdnYsLLcR4Gg3tbQEa8InVH_KoO2oLaet3iknAeNgPRCOSC-gHjv4W25VvR6V3noozt3doCsk1xSI-R5JLWeY6Gfvq71RKcnlx7GDffnGPNU2n3_9tL1o_zjmrQYpMw8stpmET2gsip4GxPVmRf1SxEexdX6f4u4ChU0w7za7kNqz28RJF7a4cqHSj7z7rZTySJAXMkRSbFUA4RwmJIDeWW3qZoDYCDy_Mp1L9HQe3emzSEFtJrsn09f2xlpZpkmeUGtbd_zNyDAcyqKwTAEilhXSZFhG7w6pTPN60i5CtMV7YgtmeRhSm9mClkSLD8ZnSjqm1tejCR8g2ockJ0O2UaQu2bzZeyjoeMB5wafyfOehn_u93T9LUzlSN6okxzRLEwSkBM1c1wam3aeIZrL_9awuFyvz6A',
        // },
        getHeaders(cookies, token),
         body:
      // {
        //   "first_name": "1b",
        //   "last_name": "b",
        //
        //
        // },

        body,
        // {
        //
        //   data: body
        //   // 'email':'basheeralkhiat86@gmail.com',
        //   // 'password':'123456789',
        //   // 'first_name':'Lory112222',
        //   // 'last_name':'Lory22222',
        //
        //   //  'service_id':'2',
        //   //  'booking_id':'1'
        //
        // }
    );


    print(7);
    print(response0.body);
    var response = jsonDecode(response0.body);
    print(response);
    print(7);
    print(response['data']);
    print(response0.statusCode);
    print(APIProvider.token);
    print('token is ${pref.get('token')}');

    // if (response.statusCode == 200) {
    //   // getc();  //
    //   return response;
    // }
    // else if (response.statusCode == 400) {
    //   throw Exception(response.data['error']);
    // } else if (response.statusCode == 500) {
    //   throw Exception('server error123');
    // } else {
    //   throw Exception('unkown error');
    // }
    if (response0.statusCode == 200) {
      print(response0.statusCode);
      return response0;
    }
    else if (response0.statusCode == 400) {
      throw Exception('${response0.statusCode}');
    } else if (response0.statusCode == 500) {
      throw Exception('server error123');
    } else {
      throw Exception('unkown error');
    }
  }

  Future<dio.Response> getRequest(
      String method, Map<String, dynamic>? queryParams,
      {required Map<String, String> headers}) async {
    try {
      dio.Response response = await _dio.get(
        method,
        queryParameters: queryParams,
        options: dio.Options(
          headers: headers,
        ),
      );

      // Handle response based on status code
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('server error');
      } else {
        throw Exception('unknown error');
      }
    } catch (e) {
      print('Error: $e');
      if (e is dio.DioError) {
        print('Response data: ${e.response?.data}');
        print('Response headers: ${e.response?.headers}');
        print('Response request: ${e.requestOptions}');
      }
      throw Exception('Error: $e');
    }
  }

  Future<dio.Response> putRequest(
    String method,
    Map<String, dynamic> queryParams,
    dynamic body, {
    required Map<String, String> headers,
  }) async {
    try {
      return await _dio.put(
        method,
        queryParameters: queryParams,
        data: body,
        options: dio.Options(headers: headers),
      );
    } on dio.DioException catch (e) {
      if (e.response != null) {
        print('Dio error: ${e.response!.statusCode} - ${e.response!.data}');
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        print('Dio error: ${e.message}');
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      print('General error: $e');
      throw Exception('Error: $e');
    }
  }

  /* Future<dio.Response> putRequest(
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
  }*/

  Future<dio.Response> deleteRequest(String method,
      {Map<String, String> headers = const {}}) async {
    try {
      final response = await _dio.delete(
        method,
        options: dio.Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('server error');
      } else {
        throw Exception('unknown error');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  Map<String,String>? getHeaders(String? cookies,String?token){
    if (cookies != null && token != null){
      return{
        'Authorization': 'Bearer ${token}',
        'Cookie': cookies,
      };
    }
    else if (cookies != null){
      return{
        'Cookie': cookies,
      };
    }
    else if(token!=null){ return{
      'Authorization': 'Bearer ${token}',
    };
    }

  }
}

//TODO GET REQUEST
/*
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
*/
