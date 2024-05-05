import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../providers/api_provider.dart';



class CheckEmailRepo extends GetxService{
  static List<String>? cookies;

  APIProvider apiProvider=Get.find<APIProvider>();

  Future<AppResponse<String>> Checkemail(String username) async {
    print("\n1");

    try {

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}register/email",
        {},
        jsonEncode({
          "email": username,
        }),
      );
      print("\n2");
      cookies =response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");
      print("Response token: ${response.data["token"]}");
      print("Response cookies: ${response.data["Cookies"]}");

      print("Response cookies: ${cookies}");
      print("Response header: ${response.headers}");
      print("Response header: ${response}");
     // cookie = response.headers['set-cookie'];

      if (response.statusCode == 200) {
        return AppResponse<String>(
          success: true,
          //data: response.data["token"],
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