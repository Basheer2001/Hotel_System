import 'package:flutter/material.dart';

// Dummy user data class
class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

// Dummy data fetching function
Future<List<User>> fetchAllUsers() async {
  await Future.delayed(Duration(seconds: 2)); // Simulating network delay
  // Replace this with your actual data fetching logic
  return [
    User(id: '1', name: 'User One', email: 'userone@example.com'),
    User(id: '2', name: 'User Two', email: 'usertwo@example.com'),
    User(id: '3', name: 'User Three', email: 'userthree@example.com'),
  ];
}

class ViewAllUsers extends StatefulWidget {
  @override
  _ViewAllUsersState createState() => _ViewAllUsersState();
}

class _ViewAllUsersState extends State<ViewAllUsers> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View All Users'),
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching users'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  onTap: () {
                    // Handle user tap if needed
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
