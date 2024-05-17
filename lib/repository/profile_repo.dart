import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../models/app_response.dart';
import '../providers/api_provider.dart';


class ProfileRepo extends GetxService{

  APIProvider apiProvider=Get.find<APIProvider>();

  Future<AppResponse<String>> updateprofile(String username,String number ,String newpassword ,String newpasswordconfirmation,String currentpassword,)async {
    print("\n1");
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}user/profile",
        {},
        jsonEncode({

          "name":  username,
          "phone":number,
          "new_password":newpassword,
          "new_password_confirmation":newpasswordconfirmation,
          "current_password":currentpassword,

        }),
        token: APIProvider.token
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
      print("Dio error during login: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }

  Future<AppResponse<Map<String, dynamic>>> getProfile(String token) async {
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
            data: Map<String, dynamic>.from(response.data),
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
  }


}


