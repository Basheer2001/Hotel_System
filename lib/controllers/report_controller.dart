import 'package:get/get.dart';

import '../models/app_response.dart';
import '../repository/report_repo.dart';

class SomeController extends GetxController {
  ReportRepo reportRepo = Get.find<ReportRepo>();

  void createReport() async {
    AppResponse<Map<String, dynamic>> response = await reportRepo.makeReport(
      18, // Assuming user ID is 18
      "room", // Title of the report
      "picture", // Description of the report
    );

    if (response.success) {
      // Report created successfully
      Map<String, dynamic> report = response.data!;
      // Handle the created report
    } else {
      // Error creating report
      String errorMessage = response.errorMessage!;
      // Handle the error
    }
  }
}
