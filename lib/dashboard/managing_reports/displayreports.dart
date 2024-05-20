import 'package:flutter/material.dart';

class DisplayReports extends StatelessWidget {
  final String userId;

  DisplayReports({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Reports'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reports for User: $userId',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ReportCard(
                title: 'Daily Revenue',
                value: '\$500',
              ),
              SizedBox(height: 10),
              ReportCard(
                title: 'Weekly Occupancy Rate',
                value: '70%',
              ),
              SizedBox(height: 10),
              ReportCard(
                title: 'Monthly Expenses',
                value: '\$2000',
              ),
              // Add more report cards as needed
            ],
          ),
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final String value;

  ReportCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
