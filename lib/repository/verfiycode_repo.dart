import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../models/app_response.dart';
import '../providers/api_provider.dart';

class VerfiyCodeRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<String>> verfiycode(String number) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "http://127.0.0.1:8000/api/register/code",
        {},
        jsonEncode({
          "number": number,
        }),
      );
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        print("Response body: $responseData");
        final String? token = responseData["token"];
        if (token != null) {
          return AppResponse<String>(
            success: true,
            data: token,
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
