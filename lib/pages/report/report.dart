import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/repository/report_repo.dart';

import '../../models/app_response.dart'; // Import your AccountRepo class

class Report extends StatelessWidget {
  final ReportRepo reportRepo = Get.find<ReportRepo>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 4,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _submitReport(context);
              },
              child: Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitReport(BuildContext context) async {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }

    // Assuming userId is available in your application
    int userId = 18; // Replace 18 with actual userId

    AppResponse<Map<String, dynamic>> response =
    await reportRepo.makeReport(userId, title, description);

    if (response.success) {
      // Report created successfully
      Map<String, dynamic> report = response.data!;
      // Handle success (e.g., show success message)
      Get.snackbar('Success', 'Report created successfully');
    } else {
      // Error creating report
      String errorMessage = response.errorMessage!;
      // Handle error (e.g., show error message)
      Get.snackbar('Error', errorMessage);
    }
  }
}
