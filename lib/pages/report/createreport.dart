import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/report_controller.dart';

class CreateReport extends StatelessWidget {
  final ReportController reportController = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Report')),
      body: Form(
        key: reportController.formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: reportController.titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: reportController.descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Obx(() {
                if (reportController.reportCreationLoadingState.value) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: reportController.createReport,
                  child: Text('Create Report'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
