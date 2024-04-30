import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../models/app_response.dart';
import '../providers/api_provider.dart';


class CheckEmailRepo extends GetxService{

  APIProvider apiProvider=Get.find<APIProvider>();

  Future<AppResponse<String>> Checkemail(String username) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "http://127.0.0.1:8000/api/register/email",
        {},
        jsonEncode({
          "email": username,
        }),
      );
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        return AppResponse<String>(
          success: true,
          data: response.data["token"],
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}