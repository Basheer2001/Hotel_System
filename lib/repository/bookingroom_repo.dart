import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:convert';

import '../models/app_response.dart';
import '../providers/api_provider.dart';



class BookingRoomRepo extends GetxService{

  APIProvider apiProvider=Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> booking( String roomId,
      String checkInDate,
      String checkOutDate,
       String numAdults,
      String numChildren,
     String paymentMethod,) async {
    print("\n1");

    try {

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}booking",
        {},
        jsonEncode({
          "room_id": roomId,
          "check_in_date": checkInDate,
          "check_out_date": checkOutDate,
          "num_adults": numAdults,
          "num_children": numChildren,
          "payment_method": paymentMethod,
        }),
      );
      print("\n2");
      APIProvider.cookies =response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      print("Response cookies: ${ APIProvider.cookies}");
      print("Response header: ${response.headers}");
      print("Response header: ${response}");
      // cookie = response.headers['set-cookie'];

      if (response.statusCode == 200) {
        return AppResponse<Map<String, dynamic>>(
            success: true,
            data: response.data["data"]);
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}