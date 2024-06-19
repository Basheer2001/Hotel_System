import 'package:get/get.dart';
import '../constant/sharedprefrence/shared.dart';
import '../pages/services/services.dart';
import '../providers/api_provider.dart';

class ServicesRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<List<Service>> getServices() async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}index/services",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response data: ${response.data}");

      if (response.statusCode == 200 && response.data['status'] == true) {
        List<dynamic> servicesJson = response.data['data'];
        return servicesJson.map((json) => Service.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch services');
      }
    } catch (e) {
      print("Error fetching services: $e");
      throw e;
    }
  }
}
