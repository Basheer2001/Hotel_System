import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Services.dart';
import '../models/app_response.dart';
import '../providers/api_provider.dart';



class ProfileRepo extends GetxService{

  APIProvider apiProvider=Get.find<APIProvider>();

  MyServices myServices=Get.find();


  Future<AppResponse<String>> updateprofile(
      String firstname,
      String lastname,
      String number ,
      String newpassword ,
      String newpasswordconfirmation,
      String currentpassword,
      String address,
      {File?photo}
      ) async {
    print("\n1");
    try {
      http.Response response0 = await apiProvider.postRequest(
        "${APIProvider.url}user/profile",
        {},
        {
          "first_name": firstname,
              "last_name": lastname,
              // "number":number,
              // "newpassword": newpassword,
              // "password_confirmation":newpasswordconfirmation,
              // "current_password": currentpassword,
              // "address": address,
        },
        token: myServices.sharedPreferences.getString('token')
      );
      var response=jsonDecode(response0.body);

      //
      // print("Response status code: ${response.statusCode}");
      // print("Response body: ${response.data}");
      // print("Response token: $token");
//
      if (response0.statusCode == 200) {
        if (response0 != null) {
          return AppResponse<String>(
            success: true,
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response0.statusCode}");
      }
    }
    //catch(e){print(e);};
    on dio.DioException catch (e) {
      print("Dio error during login: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    }
    catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
    // try {
    //
    //   var formData = dio.FormData.fromMap({
    //     "first_name": firstname,
    //     "last_name": lastname,
    //     "number":number,
    //     "newpassword": newpassword,
    //     "password_confirmation":newpasswordconfirmation,
    //     "current_password": currentpassword,
    //     "address": address,
    //
    //     if (photo != null) 'photo': await dio.MultipartFile.fromFile(photo.path),
    //   });
    //
    //   dio.Response response = await apiProvider.postRequest(
    //       '${APIProvider.url}user/profile',
    //       {},
    //       formData,// Pass formData instead of jsonEncode
    //       token: APIProvider.token
    //   );
    //   print("\n2");
    //   // APIProvider.cookies =response.headers['set-cookie'];
    //   //
    //   // String token = response.data["data"];
    //
    //   print("Response status code: ${response.statusCode}");
    //   print("Response cookies: ${ APIProvider.cookies}");
    //   print("Response header: ${response.headers}");
    //   print("Response body: ${response.data}");
    //   //print("Response token: $token");
    //
    //   if (response.statusCode == 200) {
    //     if (response.data != null && response.data["data"] != null) {
    //       return AppResponse<String>(
    //         success: true,
    //         data: response.data["data"],
    //       );
    //     } else {
    //       throw Exception("Token not found in response data");
    //     }
    //   } else {
    //     throw Exception("Server responded with status code ${response.statusCode}");
    //   }
    // //} on dio.DioException catch (e) {
    // }
    // // on dio.DioException catch (e) {
    // //   print("Dio error : $e");
    // //   String errorMessage = "Network error occurred";
    // //   if (e.response != null) {
    // //     errorMessage = "Server error: ${e.response!.statusCode}";
    // //     // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
    // //   }
    // //   return AppResponse(success: false, errorMessage: errorMessage);
    // // }
    //    catch (e) {
    //   print("Error : $e");
    //   return AppResponse(success: false, errorMessage: e.toString());
    // }
  }

/*
  Future<AppResponse<String>> updateprofile(String firstname,lastname,String number ,String newpassword ,String newpasswordconfirmation,String currentpassword,String address,{File?photo})async {
    print("\n1");

    try {
      var formData = dio.FormData.fromMap({
        "first_name":  firstname,
       // "last_name": lastname,

        "phone":number,
        "new_password":newpassword,
        "new_password_confirmation":newpasswordconfirmation,
        "current_password":currentpassword,
       // "address" : address,
        // Append the image file if available
        if (photo != null) 'photo': await dio.MultipartFile.fromFile(photo.path),
      });

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}user/profile",
        {},
          jsonEncode({
            "first_name":  firstname,
            // "last_name": lastname,

            "phone":number,
            "new_password":newpassword,
            "new_password_confirmation":newpasswordconfirmation,
            "current_password":currentpassword,
          }),

       // token:  myServices.sharedPreferences.getString("token"),
        token: APIProvider.token
          //cookies: myServices.sharedPreferences.getString("cookies")
        //cookies: APIProvider.cookies!.first
      );

      print("\n2");
      APIProvider.cookies =response.headers['set-cookie'];

      String token = response.data["data"];

      print("Response status code: ${response.statusCode}");
      print("Response cookies: ${ APIProvider.cookies}");
      print("Response header: ${response.headers}");
      print("Response body: ${response.data}");
      print("Response token: $token");

      if (response.statusCode == 200) {
        if (response.data != null && response.data["data"] != null) {
          return AppResponse<String>(
            success: true,
            data: response.data["data"],
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioException catch (e) {
      print("Dio error : $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error : $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
*/

  Future<AppResponse<Map<String, dynamic>>> MyProfile() async {
    try {
      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}myProfile",
        {},
        headers: {
          'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data["data"],
        );
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error fetching profile data",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during profile fetch: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during profile fetch: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
  Future<AppResponse<Map<String, dynamic>>> getProfile() async {
    try {
      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}getProfile/1",
        {},
        headers: {
          'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data["data"],
        );
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error fetching profile data",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during profile fetch: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during profile fetch: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }


  /*Future<AppResponse<Map<String, dynamic>>> getProfile(String token) async {
    try {
      dio.Response response = await apiProvider.getRequest(
          "${APIProvider.url}user/profile",
        null,
        cookie: 'Bearer $token',
      );

      APIProvider.cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response cookies: ${APIProvider.cookies}");
      print("Response header: ${response.headers}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data != null) {
          return AppResponse<Map<String, dynamic>>(
            success: true,
          //  data: Map<String, dynamic>.from(response.data),
          );
        } else {
          throw Exception("No data found in response");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioError catch (e) {
      print("Dio error during getProfile: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during getProfile: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }*/


}


