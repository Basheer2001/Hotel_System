import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/roomsearch_controller.dart';
class CircularAppBarShape extends RoundedRectangleBorder {
  CircularAppBarShape()
      : super(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
  );
}

class RoomsResult extends StatelessWidget {
  final RoomSearchController roomSearchController = Get.find<RoomSearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rooms',
          style: TextStyle(
            color: Colors.blue,
            shadows: [
              Shadow(
                offset: Offset(5.0, 5.0), // Shadow position
                blurRadius: 3.0, // Shadow blur
                color: Colors.grey, // Shadow color
              ),
            ],
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
//
            Expanded(
              child: Obx(() {
                if (roomSearchController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (roomSearchController.rooms.isEmpty) {
                  return Center(child: Text('No rooms available'));
                }

                return ListView.builder(
                  itemCount: roomSearchController.rooms.length,
                  itemBuilder: (context, index) {
                    final room = roomSearchController.rooms[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      elevation: 4,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          room.roomNumber,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('View: ${room.view}'),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }


}



