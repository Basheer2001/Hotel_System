import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final List<dynamic> wishlistData;


  Favorite({required this.wishlistData}); // Updated constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: wishlistData.length,
              itemBuilder: (context, index) {
                final item = wishlistData[index];
                return ListTile(
                  title: Text('Room Number: ${item['room_number']}'),
                  subtitle: Text('Status: ${item['status']}'),
                  trailing: Text('Floor: ${item['floor']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
