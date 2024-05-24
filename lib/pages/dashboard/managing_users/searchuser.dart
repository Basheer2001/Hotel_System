import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchUser extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  void _searchUser() {
    // Implement your user search logic here
    String query = _searchController.text;
    // Call your API or service to search for the user
    print('Searching for user with query: $query');
    Get.snackbar('Search Results', 'User found: $query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Name or Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchUser,
              child: Text('Search User'),
            ),
          ],
        ),
      ),
    );
  }
}
