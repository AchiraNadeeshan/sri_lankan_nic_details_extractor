import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final String value;

  const ResultCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Apply rounded corners
      ),
      elevation: 4, // Optional: Adds elevation to the card
      child: ListTile(
        contentPadding:
            const EdgeInsets.all(0), // No padding for the ListTile itself
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0), // Padding for the title
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Padding(
          padding:
              const EdgeInsets.only(left: 16.0), // Padding for the subtitle
          child: Text(value),
        ),
      ),
    );
  }
}
