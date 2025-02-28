import 'package:flutter/material.dart';

/// A customizable card widget used to display key-value results.
///
/// The [ResultCard] widget is designed with a predefined width, height,
/// and customizable styling options such as colors and border properties.
/// It is particularly useful for displaying extracted NIC details in the app.
class ResultCard extends StatelessWidget {
  /// The title of the card, usually representing the data label.
  final String title;

  /// The value associated with the title, which will be displayed below the title.
  final String value;

  /// The width of the card (default is `400`).
  final double width;

  /// The height of the card (default is `90`).
  final double height;

  /// The background color of the card (default is `Color(0xFF181825)`).
  final Color cardColor;

  /// The border color of the card (default is `Color(0xFF6C7086)`).
  final Color borderColor;

  /// The color of the title text (default is `Color(0xFFA6E3A1)`).
  final Color titleColor;

  /// The color of the value text (default is `Color(0xFFCDD6F4)`).
  final Color valueColor;

  /// The elevation of the card, which determines its shadow depth (default is `8.0`).
  final double elevation;

  /// Creates a [ResultCard] with customizable properties.
  ///
  /// * The [title] and [value] are required.
  /// * Optional parameters allow customization of size, colors, and elevation.
  const ResultCard({
    super.key,
    required this.title,
    required this.value,
    this.width = 400,
    this.height = 90,
    this.cardColor = const Color(0xFF181825),
    this.borderColor = const Color(0xFF6C7086),
    this.titleColor = const Color(0xFFA6E3A1),
    this.valueColor = const Color(0xFFCDD6F4),
    this.elevation = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    // Adjusts text size based on system preferences
    double textScale = MediaQuery.textScaleFactorOf(context);

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor, width: 2),
        ),
        elevation: elevation,
        shadowColor: Colors.black.withOpacity(0.2),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18 * textScale,
                  color: titleColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16 * textScale,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
