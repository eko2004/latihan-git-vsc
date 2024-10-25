import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('assets/image/pic1.jpg'),
    Image.asset('assets/image/pic2.jpg'),
    Image.asset('assets/image/pic3.jpg'),
  ],
),
     ),
    );
  }
}
