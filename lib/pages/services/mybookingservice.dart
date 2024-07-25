import 'package:flutter/material.dart';

import '../../constant/appbar/circularappbarshape.dart';
import 'services.dart';

class MyBookingService extends StatelessWidget {
  final List<Service> services;

  MyBookingService({required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Booking Services',
            style: TextStyle(color: Colors.blue,
              shadows: [
                Shadow(
                  offset: Offset(5.0, 5.0), // Shadow position
                  blurRadius: 3.0, // Shadow blur
                  color: Colors.grey, // Shadow color
                ),
              ],

            )
        ),
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body:
      Padding(
        padding: const EdgeInsets.only(top:30),
        child: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            IconData serviceIcon = Icons.local_offer;
            return Card(
              elevation: 4, // Adjust elevation as needed
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(
                  serviceIcon,
                  color: Colors.blue, // Adjust icon color as needed
                ),
                title: Text(
                  service.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),

    );
  }
}