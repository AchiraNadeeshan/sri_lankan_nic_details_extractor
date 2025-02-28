import 'package:flutter/material.dart';

/// A customizable card widget to display key-value results.
class ResultCard extends StatelessWidget {
  final String title;
  final String value;
  final double width;
  final double height;
  final Color cardColor;
  final Color borderColor;
  final Color titleColor;
  final Color valueColor;
  final double elevation;

  /// Constructor with customizable properties.
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
    this.elevation = 8.0, // Default elevation
  });

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);

    return SizedBox(
      width: width, // Adjustable width
      height: height, // Adjustable height
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
          side: BorderSide(color: borderColor, width: 2), // Border color
        ),
        elevation: elevation, // Customizable elevation
        shadowColor: Colors.black.withOpacity(0.2), // Dynamic shadow effect
        color: cardColor, // Background color of the card
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Padding inside the card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18 * textScale, // Adjusts to user settings
                  color: titleColor, // Custom title color
                ),
              ),
              const SizedBox(height: 5), // Space between title & value
              Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16 * textScale, // Adjusts to user settings
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
