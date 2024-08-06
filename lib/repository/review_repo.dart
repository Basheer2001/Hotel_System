import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../providers/api_provider.dart';

class ReviewRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<bool> isStayComplete(int roomNumber) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}viewInvoice",
        {},
        jsonEncode({"id": roomNumber}),
      );

      if (response.statusCode == 200 && response.data["status"]) {
        var invoiceData = response.data["data"]["invoice"];
        var remainingAmount = double.parse(invoiceData["remaining_amount"]);
        return remainingAmount == 0.0;
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during checking stay completion: $e");
      return false;
    }
  }

  Future<AppResponse<String>> postReview(int roomNumber, int rating, String comment) async {
    try {
      bool stayComplete = await isStayComplete(roomNumber);

      if (!stayComplete) {
        return AppResponse(success: false, errorMessage: "Cannot leave a review until the stay is complete.");
      }

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}setReview/$roomNumber",
        {},
        jsonEncode({
          "rating": rating,
          "comment": comment,
        }),
      );

      if (response.statusCode == 200) {
        return AppResponse<String>(
          success: true,
          data: response.data["message"],
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during posting review: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
