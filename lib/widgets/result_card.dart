import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final String value;

  const ResultCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
