import 'package:flutter/material.dart';
class Report extends StatelessWidget {
  final String title;
  final String value;

  const Report({required this.title, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(value),
      ),
    );
  }
}

