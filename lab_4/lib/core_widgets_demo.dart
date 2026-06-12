import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 1 – Core Widgets")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            const Text(
              "Welcome to Flutter UI",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            const Icon(Icons.movie_creation, size: 70, color: Colors.blue),

            const SizedBox(height: 30),

            Image.network(
              "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=600",
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.star),
                title: Text("Movie Item"),
                subtitle: Text("This is a sample ListTile inside a Card."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
