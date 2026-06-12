import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double rating = 50;
  bool isActive = false;
  String? selectedGenre;
  DateTime? selectedDate;

  Future<void> openDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exercise 2 – Input Controls")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Rating (Slider)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            Slider(
              value: rating,
              min: 0,
              max: 100,
              divisions: 100,
              label: rating.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            Text("Current value: ${rating.toInt()}"),

            const SizedBox(height: 20),

            const Text(
              "Active (Switch)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            SwitchListTile(
              title: const Text("Is movie active?"),
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive = value;
                });
              },
            ),

            const SizedBox(height: 10),

            const Text(
              "Genre (RadioListTile)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            RadioListTile<String>(
              title: const Text("Action"),
              value: "Action",
              groupValue: selectedGenre,
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text("Comedy"),
              value: "Comedy",
              groupValue: selectedGenre,
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
            ),

            Text("Selected genre: ${selectedGenre ?? "None"}"),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: openDatePicker,
                child: const Text("Open Date Picker"),
              ),
            ),

            if (selectedDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                ),
              ),
          ],
        ),
      ),
    );
  }
}
