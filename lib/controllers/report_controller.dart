import 'package:get/get.dart';

import '../pages/homepage/report.dart';
import '../repository/report_repo.dart';

class ReportController extends GetxController {
  final ReportRepo reportRepo = Get.find<ReportRepo>();

  var isLoading = false.obs;
  var reports = <Report>[].obs;

  @override
  void onInit() {
    fetchReports();
    super.onInit();
  }

  Future<void> fetchReports() async {
    try {
      isLoading.value = true;
      List<Report> reportsList = (await reportRepo.getReports()).cast<Report>();
      print("Fetched reports: $reportsList");
      reports.assignAll(reportsList);
    } catch (e) {
      print("Error fetching reports: $e");
    } finally {
      isLoading.value = false;
    }
  }
}


