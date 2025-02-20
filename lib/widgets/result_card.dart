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
      elevation: 8, // Optional: Adds elevation for better depth
      shadowColor: Color.fromRGBO(
          0, 0, 0, 0.2), // Updated way to add shadow with opacity
      color: Colors.white, // Sets a background color for the card
      child: Padding(
        padding: const EdgeInsets.all(12.0), // Padding inside the card
        child: ListTile(
          contentPadding: EdgeInsets.zero, // Remove internal ListTile padding
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18, // Make title font size larger
              color: Colors.black87, // Set a dark color for the title
            ),
          ),
          subtitle: Text(
            value,
            style: const TextStyle(
              fontSize: 16, // Make subtitle font size slightly smaller
              color: Colors.black54, // Lighter color for the value
            ),
          ),
        ),
      ),
    );
  }
}
