import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/appbar/circularappbarshape.dart';

class Favorite extends StatelessWidget {
  final List<dynamic> wishlistData;

  Favorite({required this.wishlistData}); // Updated constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey), // Back button icon
          onPressed: () {
            Get.back(); // Navigate back using GetX
          },
        ),
          title: Text('Favorite',
              style: TextStyle(color: Colors.blue,
            shadows: [
              Shadow(
                offset: Offset(5.0, 5.0), // Shadow position
                blurRadius: 3.0, // Shadow blur
                color: Colors.grey, // Shadow color
              ),
            ],

          )), // Adjust title color
          backgroundColor: Colors.black,
          shape: CircularAppBarShape(),


      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30,),
            if (wishlistData.isEmpty)
              Center(child: Text('No favorites added yet')),
            if (wishlistData.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: wishlistData.length,
                  itemBuilder: (context, index) {
                    final item = wishlistData[index];
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                        title: Text(
                          'Room Number: ${item['room_number']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Text(
                              'Status: ${item['status']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: item['status'] == 'available'
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Floor: ${item['floor']}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.room_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

