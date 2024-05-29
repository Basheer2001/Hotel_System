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
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        var profile = controller.profileData.value;

        return SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Obx(() => CircleAvatar(
                    radius: 45,
                    backgroundImage: controller.avatarImagePath.value.isEmpty
                        ? null
                        : FileImage(File(controller.avatarImagePath.value)),
                  )),
                  SizedBox(width: 60),
                  ElevatedButton(
                    onPressed: () {
                     // Get.to(() => UpdateProfile());
                    },
                    child: Text("Update Profile"),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              const Text(
                'Personal Information',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              buildInfoTile('First Name', profile['first_name'] ?? ''),
              buildInfoTile('Last Name', profile['last_name'] ?? ''),
              buildInfoTile('Phone', profile['phone'] ?? ''),
              buildInfoTile('Address', profile['address'] ?? ''),
              SizedBox(height: 20.0),
              Text(
                'Booking History',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              buildBookingTile('Hotel ABC', 'Check-in: Jan 1, 2024 | Check-out: Jan 3, 2024'),
              SizedBox(height: 20.0),
              Text(
                'Notification Settings',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
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
            ],
          ),
        );
      }),
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
