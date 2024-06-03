import 'package:get/get.dart';
import '../constant/sharedprefrence/shared.dart';
import '../controllers/dashboard/managing_reports_controller/displayreports_controller.dart';
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
}







