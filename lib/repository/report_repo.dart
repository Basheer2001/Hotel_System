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

  Future<AppResponse<Report>> reportsomthing(String title, String text) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}make/reports",
        {},
        jsonEncode({
          "title": title,
          "text_description": text,
        }),
      );


      //cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data != null && response.data["report"] != null) {
          var reportData = response.data["report"];
          Report report = Report(
            id: reportData["id"],
            title: reportData["title"],
            description: reportData["text_description"],
          );

          return AppResponse<Report>(
            success: true,
            data: report,
          );
        } else {
          throw Exception("Report details not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during writing report: $e");
      return AppResponse<Report>(success: false, errorMessage: e.toString());
    }
  }


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



}







