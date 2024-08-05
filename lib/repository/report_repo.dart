import 'dart:convert';

import 'package:dio/dio.dart'as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:untitled1/repository/profile_repo.dart';
import '../constant/sharedprefrence/shared.dart';
import '../models/app_response.dart';
import '../pages/report/report.dart';
import '../providers/api_provider.dart';

class ReportRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();


  Future<List<Report>> getReports() async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}reports",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        List<dynamic> reportsJson = response.data['msg']['reports'];
        return reportsJson.map((json) => Report.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch reports');
      }
    } catch (e) {
      print("Error fetching reports: $e");
      throw e;
    }
  }

  Future<AppResponse<Map<String, dynamic>>> createReport(String title, String textDescription) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}reports",
        {},
        jsonEncode({
          "title": title,
          "text_description": textDescription,
        }),
      );

      if (response.statusCode == 201 && response.data["status"] == true) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data["msg"]["report"],
        );
      } else {
        throw Exception(response.data["msg"]);
      }
    } on dio.DioException catch (e) {
      print("Dio error during report creation: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during report creation: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}















