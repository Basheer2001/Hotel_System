import 'package:flutter/material.dart';

class MultipleReportsCheck extends StatelessWidget {
  final List<String> reportsArray;

  MultipleReportsCheck({required this.reportsArray});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Reports Check'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unchecked Reports',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: reportsArray.length,
                itemBuilder: (context, index) {
                  final reportTitle = 'Report ${index + 1}'; // Generate report title dynamically
                  final isChecked = reportsArray[index] == '1'; // Check if the report is marked as checked

                  return ReportCheckTile(
                    reportTitle: reportTitle,
                    isChecked: isChecked,
                    onTap: () {
                      // Handle onTap event
                      // You can implement logic to toggle the checked state of the report here
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportCheckTile extends StatelessWidget {
  final String reportTitle;
  final bool isChecked;
  final VoidCallback onTap;

  ReportCheckTile({
    required this.reportTitle,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        reportTitle,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: isChecked ? Icon(Icons.check) : null,
      onTap: onTap,
    );
  }
}
