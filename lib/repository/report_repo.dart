import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../models/app_response.dart';
import '../providers/api_provider.dart';

class ReportRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> makeReport(int userId, String title, String description) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}make/reports",
        {},
        {
          "user_id": userId,
          "title": title,
          "text_description": description,
        },
        token: APIProvider.token, // Pass the token from APIProvider
      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        // Assuming your response has the same structure as the example you provided
        bool status = response.data["status"];
        int errNum = response.data["errNum"];
        if (status) {
          // Report created successfully
          Map<String, dynamic> report = response.data["msg"]["report"];
          return AppResponse<Map<String, dynamic>>(
            success: true,
            data: report,
          );
        } else {
          // Report creation failed
          String message = response.data["msg"]["message"];
          throw Exception(message);
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error making report: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
