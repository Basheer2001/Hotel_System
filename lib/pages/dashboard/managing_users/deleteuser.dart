import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/appbar/circularappbarshape.dart';

class DeleteUser extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  void _deleteUser() {
    // Implement your user deletion logic here
    String email = _emailController.text;
    String userId = _userIdController.text;
    // Call your API or service to delete the user
    print('Deleting user with email: $email or user ID: $userId');
    Get.snackbar('User Deleted', 'The user has been successfully deleted.');
  }

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text('Delete User', style: TextStyle(color: Colors.grey)), // Adjust title color
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
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(
                labelText: 'User ID',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)
                  )
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteUser,
              child: Text('Delete User', style: TextStyle(color: Colors.black)),
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
