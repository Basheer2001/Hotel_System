import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final List<dynamic> wishlistData;
  final List<dynamic> reportsData; // Added reports data

  Favorite({required this.wishlistData, required this.reportsData}); // Updated constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Column(
        children: [
          // Display reports here
          if (reportsData.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: reportsData.length,
                itemBuilder: (context, index) {
                  final report = reportsData[index];
                  // Build the report item UI here
                  return ListTile(
                    title: Text('Report ${index + 1}'),
                    // Customize the subtitle as needed based on the report data
                    subtitle: Text('Details: ${report['details']}'),
                  );
                },
              ),
            ),
          // Display wishlist items here
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
