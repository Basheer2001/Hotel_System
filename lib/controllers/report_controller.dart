import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/app_response.dart';
import '../pages/homepage/reportt.dart';
import '../repository/report_repo.dart';

class ReportController extends GetxController {
  final ReportRepo reportRepo = Get.find<ReportRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  var isLoading = false.obs;
  var reports = <Reportt>[].obs;
  var reportCreationLoadingState = false.obs;


  var firstSubmit =false.obs;
  var loginLoadingState=false.obs;

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  @override
  void onInit() {
    fetchReports();
    super.onInit();
  }

  Future<void> fetchReports() async {
    try {
      isLoading.value = true;
      List<Reportt> reportsList = (await reportRepo.getReports()).cast<Reportt>();
      print("Fetched reports: $reportsList");
      reports.assignAll(reportsList);
    } catch (e) {
      print("Error fetching reports: $e");
    } finally {
      isLoading.value = false;
    }
  }


  void createReport() async {
    if (formKey.currentState!.validate()) {
      reportCreationLoadingState.value = true;
      AppResponse<Map<String, dynamic>> response = await reportRepo
          .createReport(
        titleController.text,
        descriptionController.text,
      );
      reportCreationLoadingState.value = false;

      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text("Report created successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          content: Text(response.errorMessage ?? "Unknown error"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        );
      }
    }
  }
}


