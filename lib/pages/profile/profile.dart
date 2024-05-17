import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profile_Controller.dart';
import 'updateprofile.dart';



class Profile extends GetView<ProfileController> {

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Obx(() =>
                CircleAvatar(
                  radius: 45,
                  backgroundImage: controller.avatarImagePath.value.isEmpty?null:FileImage(File(controller.avatarImagePath.value)),
                ),
                ),

                SizedBox(width: 60,),
                ElevatedButton(onPressed: (){
                  Get.to(() => UpdateProfile());
                }, child: Text("Update Profile"))
              ],
            ),

            SizedBox(height: 20.0),

            // Personal Information Section
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            // ListTiles for personal information
            // Example:
            buildInfoTile('Name', 'John Doe'),
            buildInfoTile('Email', 'john.doe@example.com'),

            SizedBox(height: 20.0),

            // Booking History Section
            Text(
              'Booking History',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            // ListTiles for booking history
            // Example:
            buildBookingTile('Hotel ABC', 'Check-in: Jan 1, 2024 | Check-out: Jan 3, 2024'),

            SizedBox(height: 20.0),

            // Notification Settings Section
            Text(
              'Notification Settings',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            // SwitchListTile for notification settings
            // Example:
            SwitchListTile(
              title: Text(
                'Receive Push Notifications',
                style: TextStyle(fontSize: 16.0),
              ),
              value: true, // Example value, replace with actual notification setting
              onChanged: (newValue) {
                // Update notification setting
              },
            ),
            // Add more notification settings options as needed



          ],
        ),
      ),
    );
  }

  Widget buildInfoTile(String title, String subtitle) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.edit),
        onTap: () {
          // Navigate to edit screen
        },

      ),
    );
  }

  Widget buildBookingTile(String title, String subtitle) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        onTap: () {
          Get.to(() => ()); // Navigate to booking details
        },
      ),
    );
  }
}
