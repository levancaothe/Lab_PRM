import 'package:flutter/material.dart';

class LayoutBasicsDemo extends StatelessWidget {
  const LayoutBasicsDemo({super.key});

  static const List<String> movies = [
    "Avatar",
    "Headphone",
    "Interfactor",
    "Joker",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Layout Basics")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Now Playing",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          movies[index][0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(movies[index]),
                      subtitle: const Text("Sample description"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
