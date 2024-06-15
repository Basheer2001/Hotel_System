import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/appbar/circularappbarshape.dart';


class GetProfile extends StatelessWidget {
  final String userId;

  void _deleteUser() {
    // Implement your user deletion logic here

    //String userId = _userIdController.text;
    // Call your API or service to delete the user
    Get.snackbar('User Deleted', 'The user has been successfully deleted.');
  }

  GetProfile({required this.userId});

  @override
  Widget build(BuildContext context) {
    Color customColor = Color.fromRGBO(255, 160, 42, 1.0);
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
          title: Text('View All Users', style: TextStyle(color: Colors.grey)), // Adjust title color
          backgroundColor: Colors.black,
          shape: CircularAppBarShape(),
          iconTheme: IconThemeData(color: Colors.grey)
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30,),
              TextField(
               // controller: _userIdController,
                decoration: InputDecoration(
                    labelText: 'User ID',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: (){},
                child: Text('Get User Profile', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: customColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}


