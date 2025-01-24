import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final response;
  const HomePage({super.key, this.response});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to Home Page"),
            // Text(widget.response),
            Center(child: Text(widget.response.toString())),
          ],
        ),
      ),
    );
  }
}
