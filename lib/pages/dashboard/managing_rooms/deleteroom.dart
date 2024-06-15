import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/appbar/circularappbarshape.dart';

class DeleteRoom extends StatelessWidget {

  final TextEditingController _roomIdController = TextEditingController();
  Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

  void deleteRoom() {
    String roomId = _roomIdController.text;
    // Call your API or service to delete the user
    Get.snackbar('Room Deleted', 'The room has been successfully deleted.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Delete Room', style: TextStyle(color: Colors.grey)), // Adjust title color
        backgroundColor: Colors.black,
        shape: CircularAppBarShape(),
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
           SizedBox(height: 30,),
            TextField(
              controller: _roomIdController,
              decoration: InputDecoration(
                labelText: 'Room ID',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deleteRoom,
              child: Text('Delete Room', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: customColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
