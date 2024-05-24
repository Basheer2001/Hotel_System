import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _userIdController,
              decoration: InputDecoration(
                labelText: 'User ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteUser,
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }
}
