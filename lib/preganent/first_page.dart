import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Your first page UI goes here
    return Scaffold(
      appBar: AppBar(
        title: Text('yoga'),
        centerTitle: true, // Center the app bar title
      ),
      body: Center(
        child: Text('This is the First Page'),
      ),
    );
  }
}
