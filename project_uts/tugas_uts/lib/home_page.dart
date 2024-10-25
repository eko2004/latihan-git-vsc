import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String fullname;

  const HomePage({super.key, required this.fullname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.person,
                  size: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Selamat Datang!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  fullname,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Redirect ke halaman login
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text("Logout"),
                ),
              ],
            )),
      ),
    );
  }
}