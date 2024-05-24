import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteRoom extends StatelessWidget {

  final TextEditingController _roomIdController = TextEditingController();



  void deleteRoom() {
    String roomId = _roomIdController.text;
    // Call your API or service to delete the user
    Get.snackbar('Room Deleted', 'The room has been successfully deleted.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Room'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: _roomIdController,
              decoration: InputDecoration(
                labelText: 'Room ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deleteRoom,
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }
}
