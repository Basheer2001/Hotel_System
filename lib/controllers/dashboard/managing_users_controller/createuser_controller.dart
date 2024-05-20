
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserType { user, work, Banuser }


class UserCreationController extends GetxController {
  String firstName = '';
  String lastName = '';
  String password = '';
  String confirmPassword = '';
  String permissionId = '';
  String phone='';
  String personalid='';
  String address='';
  UserType? userType;


  void createUser() {
    // Validate input fields and create user
    if (firstName.isEmpty ||
        lastName.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        permissionId.isEmpty) {
      // Show error message
      Get.snackbar(
        'Error',
        'All fields are required',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (password != confirmPassword) {
      // Show error message
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    print('User created:');
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Password: $password');
    print('Permission ID: $permissionId');
    print('User Type: ${userType.toString()}');

    Get.snackbar(
      'Success',
      'User created successfully',
    );
  }
}