import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:untitled1/repository/checkemail_repo.dart';

import '../models/app_response.dart';
import '../providers/api_provider.dart';

class VerfiyCodeRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<String>> verfiycode(String number,{dynamic head}) async {
    try {
      print("\n1\n");
      print(number);

      dio.Response response = await apiProvider.postRequest(
        "http://192.168.1.110:8000/api/register/code",
        {},
        jsonEncode({
          "verification_code": number,
        }),
        head: head,


      );
      print("\n2");
      CheckEmailRepo.cookies =response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("\n13");

      print("Response body: ${response.data}");
      print("\n14");

      print("Response token: ${response.data["token"]}");
      print("Response token: ${CheckEmailRepo.cookies!.first}");

      print("\n15");

      if (response.statusCode == 200) {
        print("\n16");

          return AppResponse<String>(

              success: true,
            data: response.data["token"]);

      } else {
        print("\n17");

        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("\n18");

      print("Errrror during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
