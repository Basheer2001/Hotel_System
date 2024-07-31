// import 'dart:convert';
//
// import 'package:dio/dio.dart' as dio;
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Services.dart';
//
// class APIProvider extends GetxService {
//   ////
//
//   static String url = "http://192.168.1.110:8000/api/";
//   static String? token;
// //static String url = "http://127.0.0.1:8000/api/";
// //static String url = "http://192.168.1.4:8000/api/";
//
//   late dio.Dio _dio;
//   static List<String>? cookies;
//
//   // Getter for the token
// //Dio getc()=>Dio()..httpClientAdapter=BrowserHttpClientAdapter(withCredentials: true);
//   APIProvider() {
//     _dio = dio.Dio(
//       dio.BaseOptions(
//           //  baseUrl: "https://reqres.in/api/",
//           //  connectTimeout: Duration(seconds: 30),
//           // 10 minutes in milliseconds
//           //  extra: {"withCredentials":true},
//           validateStatus: (status) {
//         return true;
//         //  return status!=null && status>=200 && status<300;
//       }),
//     );
//   }
//
//   //Future<http.Response>postRequest(
//   Future postRequest(
//       String method, Map<String, dynamic> queryParams, dynamic body,
//       {String? cookies, String? token}) async {
//     SharedPreferences pref =  await SharedPreferences.getInstance();
//
//     // print(1);
//     // DioForBrowser dioForBrowser = DioForBrowser(_dio.options);
//     // print(2);
//     // var adapter= BrowserHttpClientAdapter();
//     // print(3);
//     // adapter.withCredentials=true;
//     // print(4);
//     // _dio.httpClientAdapter=adapter;
//
//     print(5);
//     // if (cookies != null || token != null) {
//     //   _dio.options = dio.BaseOptions(
//     //       headers: {
//     //     'Cookie': cookies ?? cookies,
//     //     'Authorization': token ?? 'Bearer ${token}'
//     //   });
//     // }
//     print(6);
//     // dio.Response response =
//     //     await _dio.post(
//     //          method,
//     //          queryParameters: queryParams,
//     //
//     //         data: body
//     //
//     //     );
//     http.Response response0 = await http.post(
//         Uri.parse(
//           //'http://192.168.1.110:8000/api/login'
//             //'http://192.168.1.110:8000/api/user/profile'
//           method
//           // "${APIProvider.url}user/profile",
//         ),
//          headers:
//       // {
//         //   'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZGY0MjcyZTI1ZWRmMGEyYzMyNDViMDM2ZTE4ZWZiN2UwYmI4MzYxMzZkOThkMWYxZmFhN2EzM2NlZTBmNzg0MDYwNjM3ZWY1YzRjNWM0OGIiLCJpYXQiOjE3MjI0MzY2NzMuMjIzNTc2LCJuYmYiOjE3MjI0MzY2NzMuMjIzNTgxLCJleHAiOjE3NTM5NzI2NzMuMTg3NjE3LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.kYdwWqd5Fy1G3OUFmylzzfGLOuGzi-U7yStxlqO90MZ-kM4SG0ejqXG7a4EurCU46s33-X_y3OmPZJ_Vk3bAy6HaPc71uWYT_mx59G92WMp8gp7cgTtS9M9A4T_9N6acZz1GA1NY2KpPpYKhKGssN_vLJvvi5SR8gd34UuXv6WqsJYmW3796yOnAVn-_2N3hoGoWm9cOQjNizQ5HQ7Ul452opmyenX-Vit8_ZoAmIQdGTX5qFdPK4er1cD9yrr5CeSFHC1NMjAEeRdnYsLLcR4Gg3tbQEa8InVH_KoO2oLaet3iknAeNgPRCOSC-gHjv4W25VvR6V3noozt3doCsk1xSI-R5JLWeY6Gfvq71RKcnlx7GDffnGPNU2n3_9tL1o_zjmrQYpMw8stpmET2gsip4GxPVmRf1SxEexdX6f4u4ChU0w7za7kNqz28RJF7a4cqHSj7z7rZTySJAXMkRSbFUA4RwmJIDeWW3qZoDYCDy_Mp1L9HQe3emzSEFtJrsn09f2xlpZpkmeUGtbd_zNyDAcyqKwTAEilhXSZFhG7w6pTPN60i5CtMV7YgtmeRhSm9mClkSLD8ZnSjqm1tejCR8g2ockJ0O2UaQu2bzZeyjoeMB5wafyfOehn_u93T9LUzlSN6okxzRLEwSkBM1c1wam3aeIZrL_9awuFyvz6A',
//         // },
//         getHeaders(cookies, token),
//          body:
//       // {
//         //   "first_name": "1b",
//         //   "last_name": "b",
//         //
//         //
//         // },
//
//         body,
//         // {
//         //
//         //   data: body
//         //   // 'email':'basheeralkhiat86@gmail.com',
//         //   // 'password':'123456789',
//         //   // 'first_name':'Lory112222',
//         //   // 'last_name':'Lory22222',
//         //
//         //   //  'service_id':'2',
//         //   //  'booking_id':'1'
//         //
//         // }
//     );
//
//
//     print(7);
//     print(response0.body);
//     var response = jsonDecode(response0.body);
//     print(response);
//     print(7);
//     print(response['data']);
//     print(response0.statusCode);
//     print(APIProvider.token);
//     print('token is ${pref.get('token')}');
//
//     // if (response.statusCode == 200) {
//     //   // getc();  //
//     //   return response;
//     // }
//     // else if (response.statusCode == 400) {
//     //   throw Exception(response.data['error']);
//     // } else if (response.statusCode == 500) {
//     //   throw Exception('server error123');
//     // } else {
//     //   throw Exception('unkown error');
//     // }
//     if (response0.statusCode == 200) {
//       print(response0.statusCode);
//       return response0;
//     }
//     else if (response0.statusCode == 400) {
//       throw Exception('${response0.statusCode}');
//     } else if (response0.statusCode == 500) {
//       throw Exception('server error123');
//     } else {
//       throw Exception('unkown error');
//     }
//   }
//
//   Future<dio.Response> getRequest(
//       String method, Map<String, dynamic>? queryParams,
//       {required Map<String, String> headers}) async {
//     try {
//       dio.Response response = await _dio.get(
//         method,
//         queryParameters: queryParams,
//         options: dio.Options(
//           headers: headers,
//         ),
//       );
//
//       // Handle response based on status code
//       if (response.statusCode == 200) {
//         return response;
//       } else if (response.statusCode == 400) {
//         throw Exception(response.data['error']);
//       } else if (response.statusCode == 500) {
//         throw Exception('server error');
//       } else {
//         throw Exception('unknown error');
//       }
//     } catch (e) {
//       print('Error: $e');
//       if (e is dio.DioError) {
//         print('Response data: ${e.response?.data}');
//         print('Response headers: ${e.response?.headers}');
//         print('Response request: ${e.requestOptions}');
//       }
//       throw Exception('Error: $e');
//     }
//   }
//
//   Future<dio.Response> putRequest(
//     String method,
//     Map<String, dynamic> queryParams,
//     dynamic body, {
//     required Map<String, String> headers,
//   }) async {
//     try {
//       return await _dio.put(
//         method,
//         queryParameters: queryParams,
//         data: body,
//         options: dio.Options(headers: headers),
//       );
//     } on dio.DioException catch (e) {
//       if (e.response != null) {
//         print('Dio error: ${e.response!.statusCode} - ${e.response!.data}');
//         throw Exception('Server error: ${e.response!.statusCode}');
//       } else {
//         print('Dio error: ${e.message}');
//         throw Exception('Network error: ${e.message}');
//       }
//     } catch (e) {
//       print('General error: $e');
//       throw Exception('Error: $e');
//     }
//   }
//
//   /* Future<dio.Response> putRequest(
//       String method, Map<String,dynamic> queryParams)async{
//     dio.Response response=await _dio.put(method,queryParameters: queryParams);
//     if(response.statusCode==200){
//       return response;
//     }else if(response.statusCode==400){
//       throw Exception(response.data['error']);
//     }else if(response.statusCode==500){
//       throw Exception('server error');
//     }else{
//       throw Exception('unkown error');
//     }
//   }*/
//
//   Future<dio.Response> deleteRequest(String method,
//       {Map<String, String> headers = const {}}) async {
//     try {
//       final response = await _dio.delete(
//         method,
//         options: dio.Options(
//           headers: headers,
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         return response;
//       } else if (response.statusCode == 400) {
//         throw Exception(response.data['error']);
//       } else if (response.statusCode == 500) {
//         throw Exception('server error');
//       } else {
//         throw Exception('unknown error');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
//   Map<String,String>? getHeaders(String? cookies,String?token){
//     if (cookies != null && token != null){
//       return{
//         'Authorization': 'Bearer ${token}',
//         'Cookie': cookies,
//       };
//     }
//     else if (cookies != null){
//       return{
//         'Cookie': cookies,
//       };
//     }
//     else if(token!=null){ return{
//       'Authorization': 'Bearer ${token}',
//     };
//     }
//
//   }
// }
//
// //TODO GET REQUEST
// /*
//   Future<dio.Response> getRequest(String method, Map<String,dynamic> queryParams)async{
//     dio.Response response=await _dio.get(method,queryParameters: queryParams);
//     if(response.statusCode==200){
//       return response;
//     }else if(response.statusCode==400){
//       throw Exception(response.data['error']);
//     }else if(response.statusCode==500){
//       throw Exception('server error');
//     }else{
//       throw Exception('unkown error');
//     }
//   }
// */
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services.dart';
class APIProvider extends GetxService{
  ////
  //
  static String url = "http://192.168.1.110:8000/api/";
  static String? token;
//static String url = "http://127.0.0.1:8000/api/";
//static String url = "http://192.168.1.4:8000/api/";


  late dio.Dio _dio;
  static List<String>? cookies;



  // Getter for the token
//Dio getc()=>Dio()..httpClientAdapter=BrowserHttpClientAdapter(withCredentials: true);
  APIProvider(){
    _dio=dio.Dio(
      dio.BaseOptions(
        // baseUrl: "http://192.168.1.110:8000/api/user/profile",
        //  connectTimeout: Duration(seconds: 30),
        // 10 minutes in milliseconds
        //  extra: {"withCredentials":true},
          headers: {
            'Cookie': cookies==null?null:cookies,
            //'Authorization' :"Bearer ${APIProvider.token}"
            'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjNlMGU3ZDA4NDY2MzcxNDE1NDc5OTVlZDVlZjJiYjMwMTRlMGI4OWFmNThhZTA3NTRkMmFiYzEzYzQwMjgzZDcxMDRkODVlN2YxYTM2ZjUiLCJpYXQiOjE3MjI0NDc3ODUuMjcyMTU4LCJuYmYiOjE3MjI0NDc3ODUuMjcyMTY1LCJleHAiOjE3NTM5ODM3ODQuODMyMjIxLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.JORNyQUX_C9RxZClziMVTTBpbliJDLKh_bIsPwLQqdAnz0NxmFay4eWdnQkhoO-Dm0oJHmGJ350K_uGrD8kb5FQq7Iwsf9XNs1oPiuhUzciicuTW6WoDU-h55mD6zIxn1u-kQKsUWckTH_PzOVyZy70LiZnkG4b8flQpeHInWrrB-E0QPK_8LRSlY_Q-r-O7tNfcPVBmmk-GgItlSzsFEi42vSfnfWmfgrI_2pCXllQmqJmGb6jWzV5jCbG4s9Wu4733IuGbrfLW3pT5TEQoUgjaPKa0NgY1XfTDSgimm5c-6VVNr06HuYDsKC0j-fUG_IU89uN4SjY-63WRwPXkEzzugXVph4-XLjLAlKMuNvg9gLDAgVqvMvJEVMeayYT7SLPk9sozQnbbWP4yE9ykoguIurvJZb9hXM-qgxHN1EapgU9MnGacSDzl3vIY5FZsEaC0bhL_adiuqS6T3WpvOOFZ2dABXIkJphxBDwBKVV9TLpK502I_NfUdluJhSSvgOXTpVrg3h9LfEXaHl5WGPaPXG4OpvkB6EvLTlnIm_W2_3svmeTXdB6Fsn0y9vI5gO3G7KUoiCDZelmXWo0du_BQU2brT5__MwOh1OjCUGtoyIkLyRr126Fzm4wSbvOXh0BW8R18j-4ZzTnznV1kWism-WImB-VF-NKfzBUTbwoo'
          },   //                '     eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWUzYWNhY2UzZTgyNjYzNDIwOWZkZGJmYzIyZGI3ODdmNDM2ZjRiZTNhYmQ4MDc5ZmM1ZDYyMzk1NzE5Nzg3MWQ3YzE5MmM3MjA0ZDVmNDUiLCJpYXQiOjE3MjI0NTE2MDQuNjAxNjU5LCJuYmYiOjE3MjI0NTE2MDQuNjAxNjY2LCJleHAiOjE3NTM5ODc2MDQuNTg2MjI2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.KSLsIUTVdVMi-78Rxi9zIV0dE9NsEDIVCb0GcoC8BCXcxdxnly5asRYK4LxOJuuL_AI7bQFh9wyZQB-Qbm0dyoCUksNaHeh9hBpVeNBiat7LsZcHVkjYbr_lmG6euXXhV3TyUEyh6tKU0v3xSIMyShIWF3rTLyA6CabwwRkZvLMqhkyQI1sqmcI09hWIDTQZ9pzvMZ-p11oDiWeHpJa_6MJKI3ZmHvklzdljQgUR-g2IzIBorfUYJKDFMwnLD1FDmNpMtSPLbp133WKA8wRMghcUh5z21ylT9_LCVcX3a4sc8i_OGCSdDhBRsQAFcDuvTyG2KoHG6FEfET6DbnpxPUg4tk6rboMQoEfzCZ2lcxhnQZeAo7yY5YCxn0kq54ZlrnGz6UE-sfITnqqlZyzPzEacQ4eVZUuRoowoLFyb7c7crVYMGfbituSkKPypxyOa2jdLyHQJ059BkLp_LF1T8btUQzT54TBf6m8FIFfYGBPq8mEa9RlRCKTFApxZT47HYJeTSk5fOd93vgYiCz53jK9tXQxA59rNQZbOTsf4ar2gf2UqvTX3kEouIS8sQrw5eYdzYvx2gkAn6o6F4jZEVToSWWANpFyPfhjEfaLcuKKzwxdFGulWOZ7azNsYbxqr4Q0hIYK8kExMItVe8FuQXxG7U4J4M9E7f5mtd3gCceU'
          //                       eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDZlMzY3NDMyZTFjYzcwY2YwNDFjMDJhNmE3ZGEzNGM5MDRlNzQxZjU4MzUwMmZhYjE0YzZlMWYzZTBjNjg4M2FhMjQ4MGI2OGZhZDhhMmIiLCJpYXQiOjE3MjI0NTIxMDguMDI5OTE5LCJuYmYiOjE3MjI0NTIxMDguMDI5OTIzLCJleHAiOjE3NTM5ODgxMDguMDAxMjM5LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.qMP7z3zHtwSrxb6TY7sSX9OwPOm7vlLPm4PVS3FXl3OF7BLXLZAI_vA7HnAH__Jaiaw6DPPIgzCqK_lJWP7GJL5Mcwjm_Ks2Rxn7BGPOl3XR8Jl-kq0EgW2KkoSkRL2N8NzzQsF0XAXCQDHxB1KpDHzq2qFWUp1xucXGFRdq2h4Q8tiXDJ0F_JN874yrC8sbh_Qj9g-x1juSNB720iC2NRLPaaMqiIuxIYgKe8uFW7aimbnZzttCP5RkyDhOooID4YkE5-ejWZgjStZPWIXs1OvosnLWcOEVARXFNJu9yfbzz_dhbcc5YpO7A1JwmIbm81P4goqzrsYnj3UZ5tT_KqpqQsk9KjiBXcKjCjuBYKaxS1AghOvt49NIqyLzlVydR0AQEIbIIocFO1e3NHYowgYJG40G3hLjCIZ0mnOY71XGS-jbjMRQUnhOYZ00_7-_6o_DHURu0rPOvvbjq0E2NUhsY9iYmEjG2cRE5dZNGAiEQ8_pORZas99OXy0UIdu1HYSB8VUJCHRP5QJDLqvj9rcFD9cQIa7E1a8xMlrpG-92-z94WiBtryjvnymrvDACKsSNmbiATQIqNGOF38BJVeZlxnIks_DSHl5P7hryMnNqZ68zAq6fwPaRBrwvLor1bNfylkYx5v73CoiqD3ohgJQ3FDn00C3SAAPX4V_j73k
          validateStatus: (status){
            return true;
            //  return status!=null && status>=200 && status<300;
          }
      ),

    );

  }

  Future<dio.Response> postRequest(
      String method,
      Map<String,dynamic> queryParams,
      dynamic body,
      {String? cookies,String?token})async{
    // print(1);
    // DioForBrowser dioForBrowser = DioForBrowser(_dio.options);
    // print(2);
    // var adapter= BrowserHttpClientAdapter();
    // print(3);
    // adapter.withCredentials=true;
    // print(4);
    // _dio.httpClientAdapter=adapter;

    print(5);
    // if (cookies!=null|| token!=null ){
    //   // _dio.options = dio.BaseOptions(
    //   //     headers: {
    //   //       // 'Cookie': cookies??cookies,
    //   //       // 'Authorization' : token?? 'Bearer ${token}'
    //   //       'Authorization' :  'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjNlMGU3ZDA4NDY2MzcxNDE1NDc5OTVlZDVlZjJiYjMwMTRlMGI4OWFmNThhZTA3NTRkMmFiYzEzYzQwMjgzZDcxMDRkODVlN2YxYTM2ZjUiLCJpYXQiOjE3MjI0NDc3ODUuMjcyMTU4LCJuYmYiOjE3MjI0NDc3ODUuMjcyMTY1LCJleHAiOjE3NTM5ODM3ODQuODMyMjIxLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.JORNyQUX_C9RxZClziMVTTBpbliJDLKh_bIsPwLQqdAnz0NxmFay4eWdnQkhoO-Dm0oJHmGJ350K_uGrD8kb5FQq7Iwsf9XNs1oPiuhUzciicuTW6WoDU-h55mD6zIxn1u-kQKsUWckTH_PzOVyZy70LiZnkG4b8flQpeHInWrrB-E0QPK_8LRSlY_Q-r-O7tNfcPVBmmk-GgItlSzsFEi42vSfnfWmfgrI_2pCXllQmqJmGb6jWzV5jCbG4s9Wu4733IuGbrfLW3pT5TEQoUgjaPKa0NgY1XfTDSgimm5c-6VVNr06HuYDsKC0j-fUG_IU89uN4SjY-63WRwPXkEzzugXVph4-XLjLAlKMuNvg9gLDAgVqvMvJEVMeayYT7SLPk9sozQnbbWP4yE9ykoguIurvJZb9hXM-qgxHN1EapgU9MnGacSDzl3vIY5FZsEaC0bhL_adiuqS6T3WpvOOFZ2dABXIkJphxBDwBKVV9TLpK502I_NfUdluJhSSvgOXTpVrg3h9LfEXaHl5WGPaPXG4OpvkB6EvLTlnIm_W2_3svmeTXdB6Fsn0y9vI5gO3G7KUoiCDZelmXWo0du_BQU2brT5__MwOh1OjCUGtoyIkLyRr126Fzm4wSbvOXh0BW8R18j-4ZzTnznV1kWism-WImB-VF-NKfzBUTbwoo'
    //   //     }
    //   // );
    // }
    print(6);
    dio.Response response=await _dio.post(
      // 'http://192.168.1.110:8000/api/user/profile',
        method,
        // queryParameters: queryParams,
        data: body
      // {
      //   'first_name':'basheer123567'
      // }
    );
    print(7);
    print(response);
    SharedPreferences pref= await SharedPreferences.getInstance();
    print(pref.get('token'));
    print(response.statusCode);
    print(APIProvider.token);
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





  Future<dio.Response> getRequest(String method, Map<String, dynamic>? queryParams,
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


  Future<dio.Response> deleteRequest(String method, {Map<String, String> headers = const {}}) async {
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