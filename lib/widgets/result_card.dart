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
    this.width = 400, // Default width
    this.height = 90, // Default height
    this.cardColor = const Color(0xFF181825), // Default card color
    this.borderColor = const Color(0xFF6C7086), // Default border color
    this.titleColor = const Color(0xFFA6E3A1), // Default title color
    this.valueColor = const Color(0xFFCDD6F4), // Default value color
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // Centers the card in the parent widget
      child: SizedBox(
        width: width, // Adjust card width
        height: height, // Adjust card height
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
            side: BorderSide(color: borderColor, width: 2), // Border color
          ),
          elevation: 8, // Adds depth
          shadowColor: const Color.fromRGBO(0, 0, 0, 0.2), // Shadow effect
          color: cardColor, // Background color of the card
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Padding inside the card
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center horizontally
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: titleColor, // Custom title color
                  ),
                ),
                const SizedBox(height: 5), // Space between title & value
                Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: valueColor, // Custom value color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
