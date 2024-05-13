import 'dart:convert';
import 'dart:io'; // Import the 'dart:io' library
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../models/app_response.dart';
import '../providers/api_provider.dart';

class HomePageRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<void> addToWishlist(int roomid,String cookie) async {
    try {
      // Call getRequest method from APIProvider
      final response = await apiProvider.getRequest(
        "wishlist",
        {},
        cookie: cookie,
      );

      // Handle response here
      print(response.data);
    }catch (e) {
      // Handle error
      print("Error: $e");
    }
  }

  Future<AppResponse<String>> getWishlist(String rating, String comment) async {
    try {
      final response = await apiProvider.postRequest(
        "${APIProvider.url}wishlist",
        {},
        jsonEncode({
          "rating": rating,
          "comment": comment,
        }),
      );

      APIProvider.cookies = response.headers['set-cookie'];
      String token = response.data["data"];

      print("Response status code: ${response.statusCode}");
      print("Response cookies: ${APIProvider.cookies}");
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
      print("Dio error during wishlist retrieval: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during wishlist retrieval: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }

/*
  Future<AppResponse<String>> deleteFromWishlist(String rating, String comment) async {
    try {
      final response = await apiProvider.deleteRequest(
        "${APIProvider.url}wishlist1",
        queryParameters: {
          'rating': rating,
          'comment': comment,
        },
      );

      APIProvider.cookies = response.headers['set-cookie'];
      String token = response.data["data"];

      print("Response status code: ${response.statusCode}");
      print("Response cookies: ${APIProvider.cookies}");
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
    } on DioError catch (e) {
      print("Dio error during wishlist deletion: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during wishlist deletion: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
*/
}








/*
  Future<void> getWishlist(int rating, String comment,String cookie) async {
    try {
      // Call getRequest method from APIProvider
      final response = await apiProvider.getRequest(
        "wishlist",
        {
          "rating": rating.toString(),
          "comment": comment,
        },
        cookie: cookie,// Endpoint for getting wishlist
      );

      // Handle response here
      print(response.data);
    } catch (e) {
      // Handle error
      print("Error: $e");
      throw e; // Rethrow the error to be handled by the caller
    }
  }
*/