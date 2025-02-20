import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final String value;
  final double width;
  final double height;
  final Color cardColor;
  final Color borderColor;
  final Color titleColor;
  final Color valueColor;

  const ResultCard({
    super.key,
    required this.title,
    required this.value,
    this.width = 350, // Default width
    this.height = 100, // Default height
    this.cardColor = Colors.white, // Default card color
    this.borderColor = Colors.grey, // Default border color
    this.titleColor = Colors.black87, // Default title color
    this.valueColor = Colors.black54, // Default value color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Adjust card width
      height: height, // Adjust card height
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          side: BorderSide(color: borderColor, width: 2), // Border color
        ),
        elevation: 8, // Adds depth
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.2), // Shadow effect
        color: cardColor, // Background color of the card
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: titleColor, // Custom title color
                ),
              ),
              const SizedBox(height: 5), // Space between title & value
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: valueColor, // Custom value color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
