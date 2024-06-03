import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/report_controller.dart';
import '../homepage/report.dart';


class Reports extends StatelessWidget {
  final ReportController reportsController = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    // Call fetchReports when this widget is built
    reportsController.fetchReports();

    return Scaffold(
      appBar: AppBar(
        title: Text('Reports'),
      ),
      body: Center(
        child: Obx(() {
          if (reportsController.isLoading.value) {
            return CircularProgressIndicator();
          } else if (reportsController.reports.isEmpty) {
            return Text('No reports available');
          } else {
            return ListView.builder(
              itemCount: reportsController.reports.length,
              itemBuilder: (context, index) {
                Report report = reportsController.reports[index];
                return ListTile(
                  title: Text(report.title),
                  // subtitle: Text(report.description), // Uncomment if needed
                );
              },
            );
          }
        }),
      ),
    );
  }
}

