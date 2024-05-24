
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserType { user, work, Banuser }


class CreateRoomController extends GetxController {
  String status = '';
  String floor = '';
  String price = '';
  String type = '';

  UserType? userType;


  void createRoom() {
    // Validate input fields and create user
    if (status.isEmpty ||
        floor.isEmpty ||
        price.isEmpty ||
        type.isEmpty
        ) {
      // Show error message
      Get.snackbar(
        'Error',
        'All fields are required',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }



    print('Room created:');
    print('Status: $status');
    print('Floor: $floor');
    print('Price: $price');
    print('Type: $type');

    Get.snackbar(
      'Success',
      'Room created successfully',
    );
  }
}