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
  //static String url = "http://192.168.1.110:8000/api/";
  static String? token;
 static String url = "http://127.0.0.1:8000/api/";
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
        //   headers: {
        //     'Cookie': APIProvider.cookies==null?null:cookies?.first,
        //     'Authorization' :"Bearer $token",
        //     //'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2I2ZjNhMjlhODZmODY2OTlmYWIzMTcxZTAzY2Q5M2Y2N2Q3ZTc2OTBiMDJmMjkwZjg0NzBmNGI2OTQwMTk0YWUzMmY4NWIwNGE0OTRkMzQiLCJpYXQiOjE3MjI3ODMyNTIuNzcxNDI4LCJuYmYiOjE3MjI3ODMyNTIuNzcxNDM4LCJleHAiOjE3NTQzMTkyNTIuNzEzNDczLCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.dQ_pZPF4SI5abNmE5_s2_sjvCSLabe4XRmXTY3hoD2WLY-Gj5w6HWiZlT7aszrTnAIwUQtQpyidRcKijc5nkwtYKv9t0dVj4CViaZW1zYbvgfZiQpJVR8N5JJVhvoC0KlNkm29o_Y9ky8iondIjfBEuEUlV7PUFvJp9K1_p7As8VlaPWhBTEZEUvklsKdMkrRCxAfkiF19ib2DmXqq20Lt6F00HXya9Zc5Fg4mUtzzoBRbaFyZ76nssmCo1UCSLmAE9_QIdgXNWuNFD_UPYmqJQibIAnHmSo4eNMSiHAMsZpXJHqYIo9wg51_5HccthJgN_AC2BNul7HNY36zqDUU7y5ay7Yz92-56DnPFjXRi2WRMfEj0VggOyZ_N4fUeICwKha7_LTFptwVtuU76FQs-esb0DRyWrVprrr8uq9J5DwZ9UPCgP8vQIoMbuukhjkdwW2WehNL0s6d5sSe6qFUEBBJcUC3ziBw4oXqfTVH1mbJFPOtOIrF5-02y8NL0KWxVlFR0hLemibcSVvW5vx_IamqSAbGSDJH3e2bvGPOdDD3QBP2_i5vtSy_XIshYP-H4cQaxFC2vytPPbnJDkV-wYqZ56G9wIy8jk7uQwwZNQNlDCEBGOhUvRmstHZFpAf943E7O0LrjazWNXGusAk1cyDa7bmFNOzcGODAlf-g3U'
        //
        //   },

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
    //SharedPreferences pref= await SharedPreferences.getInstance();
    //print(token);

   // if (cookies!=null|| token!=null ){
   //    _dio.options = dio.BaseOptions(
   //        headers: {
   //          // 'Cookie': cookies??cookies,
   //           'Authorization' : token?? 'Bearer ${token}'
   //          //'Authorization' :  'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjNlMGU3ZDA4NDY2MzcxNDE1NDc5OTVlZDVlZjJiYjMwMTRlMGI4OWFmNThhZTA3NTRkMmFiYzEzYzQwMjgzZDcxMDRkODVlN2YxYTM2ZjUiLCJpYXQiOjE3MjI0NDc3ODUuMjcyMTU4LCJuYmYiOjE3MjI0NDc3ODUuMjcyMTY1LCJleHAiOjE3NTM5ODM3ODQuODMyMjIxLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.JORNyQUX_C9RxZClziMVTTBpbliJDLKh_bIsPwLQqdAnz0NxmFay4eWdnQkhoO-Dm0oJHmGJ350K_uGrD8kb5FQq7Iwsf9XNs1oPiuhUzciicuTW6WoDU-h55mD6zIxn1u-kQKsUWckTH_PzOVyZy70LiZnkG4b8flQpeHInWrrB-E0QPK_8LRSlY_Q-r-O7tNfcPVBmmk-GgItlSzsFEi42vSfnfWmfgrI_2pCXllQmqJmGb6jWzV5jCbG4s9Wu4733IuGbrfLW3pT5TEQoUgjaPKa0NgY1XfTDSgimm5c-6VVNr06HuYDsKC0j-fUG_IU89uN4SjY-63WRwPXkEzzugXVph4-XLjLAlKMuNvg9gLDAgVqvMvJEVMeayYT7SLPk9sozQnbbWP4yE9ykoguIurvJZb9hXM-qgxHN1EapgU9MnGacSDzl3vIY5FZsEaC0bhL_adiuqS6T3WpvOOFZ2dABXIkJphxBDwBKVV9TLpK502I_NfUdluJhSSvgOXTpVrg3h9LfEXaHl5WGPaPXG4OpvkB6EvLTlnIm_W2_3svmeTXdB6Fsn0y9vI5gO3G7KUoiCDZelmXWo0du_BQU2brT5__MwOh1OjCUGtoyIkLyRr126Fzm4wSbvOXh0BW8R18j-4ZzTnznV1kWism-WImB-VF-NKfzBUTbwoo'
   //        }
   //    );
  //  }
    print(6);
    //print(token);

    dio.Response response=await _dio.post(
      // 'http://192.168.1.110:8000/api/user/profile',
        method,
        // queryParameters: queryParams,
        data: body,
      // {
      //   'first_name':'basheer123567'
      // }
      options: dio.Options(
          headers: {
            'Authorization' : token==null?null:'Bearer $token',
            'Cookie': cookies==null?null:cookies,

          }),
    );
    print(7);
   // print(response);
    //print(pref.get('token'));
    print(response.statusCode);
   // print(APIProvider.token);
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