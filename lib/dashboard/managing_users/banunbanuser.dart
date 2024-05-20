// BanUnbanUserPage.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BanUnbanUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String userId = Get.parameters['userId'] ?? ''; // Get user ID from route parameters
    return Scaffold(
      appBar: AppBar(
        title: Text('Ban/Unban User'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID: $userId'),
            ElevatedButton(
              onPressed: () {
                // Implement ban functionality here
                Get.snackbar(
                  'User Banned',
                  'User $userId has been banned',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              },
              child: Text('Ban User'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement unban functionality here
                Get.snackbar(
                  'User Unbanned',
                  'User $userId has been unbanned',
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              child: Text('Unban User'),
            ),
          ],
        ),
      ),
    );
  }
}
