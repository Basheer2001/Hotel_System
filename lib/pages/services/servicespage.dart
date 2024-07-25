import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/appbar/circularappbarshape.dart';
import '../../controllers/services/services_controller.dart';
import 'services.dart';



class ServicesPage extends StatelessWidget {
  final List<Service> services;

  ServicesPage({required this.services});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services', style: TextStyle(color: Colors.blue,
          shadows: [
            Shadow(
              offset: Offset(5.0, 5.0), // Shadow position
              blurRadius: 3.0, // Shadow blur
              color: Colors.grey, // Shadow color
            ),
          ],

        )),
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Obx(() => ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];

            return Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                title: Text(
                  service.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('ID: ${service.id}'),
                trailing: _getServiceIcon(service.name.toLowerCase()), // Use custom method to get related icon
              ),
            );
          },
        )),
      ),
    );
  }

  // Custom method to return icons based on service name
  Icon _getServiceIcon(String serviceName) {
    switch (serviceName) {
      case 'cleaning':
        return Icon(Icons.cleaning_services, color: Colors.blue);
      case 'room service':
        return Icon(Icons.room_service, color: Colors.blue);
      case 'laundry':
        return Icon(Icons.local_laundry_service, color: Colors.blue);
      default:
        return Icon(Icons.miscellaneous_services, color: Colors.blue); // Default icon
    }
  }

}


  // Custom method to return icons based on service name







