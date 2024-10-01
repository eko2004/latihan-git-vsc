import 'package:flutter/cupertino.dart'; // Importing Cupertino Widgets

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: CupertinoColors.white, // Use CupertinoColors for iOS
      ),
      child: const Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: CupertinoColors.black, // Cupertino color
          ),
        ),
      ),
    );
  }
}
