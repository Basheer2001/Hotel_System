import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard/managing_users_controller/createuser_controller.dart';

class UserCreation extends StatelessWidget {
  final UserCreationController controller = Get.put(UserCreationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            _buildTextField('First Name', controller.firstName, (value) => controller.firstName = value),
            SizedBox(height: 20),
            _buildTextField('Last Name', controller.lastName, (value) => controller.lastName = value),
            SizedBox(height: 20),
            _buildPasswordField('Password', controller.password, (value) => controller.password = value),
            SizedBox(height: 20),
            _buildPasswordField('Confirm Password', controller.confirmPassword, (value) => controller.confirmPassword = value),
            SizedBox(height: 20),
            _buildPermissionDropdown(),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Call a method to handle user creation
                controller.createUser();
              },
              child: Text('Create User'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, String value, ValueChanged<String> onChanged) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildPasswordField(String labelText, String value, ValueChanged<String> onChanged) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
      obscureText: true,
    );
  }

  Widget _buildPermissionDropdown() {
    return DropdownButtonFormField<UserType>(
      decoration: InputDecoration(
        labelText: 'Permission Type',
        border: OutlineInputBorder(),
      ),
      value: controller.userType,
      onChanged: (UserType? value) {
        if (value != null) {
          controller.userType = value;
        }
      },
      items: UserType.values.map<DropdownMenuItem<UserType>>((UserType userType) {
        return DropdownMenuItem<UserType>(
          value: userType,
          child: Text(userType.toString()),
        );
      }).toList(),
    );
  }
}
