import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../widgets/nic_input_field.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for launching URLs

/// The main input screen of the NIC Details Extractor application.
///
/// This screen provides an input field for entering a NIC number,
/// buttons for extracting/resetting details, and a footer with
/// developer information.
class InputScreen extends StatelessWidget {
  /// Creates an instance of [InputScreen].
  InputScreen({super.key});

  /// Controller for managing NIC input and extraction logic.
  final NICController controller = Get.find();

  /// Launches a URL in an external browser.
  ///
  /// This method attempts to open the GitHub profile of the developer.
  /// If the URL cannot be launched, an exception is thrown.
  void _launchURL() async {
    final Uri url = Uri.parse('https://github.com/AchiraNadeeshan');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181825), // Custom background color
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center content vertically
                children: [
                  const SizedBox(height: 40), // Adjusted top padding

                  /// Title of the application displayed at the top.
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Sri Lankan\nNIC Details Extractor",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA6E3A1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Adjust spacing

                  /// NIC input field for entering the NIC number.
                  NICInputField(controller: controller),
                  const SizedBox(
                      height: 20), // Space between input field and buttons

                  /// Buttons for extracting NIC details and resetting input.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: controller.decodeNIC,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA6E3A1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "EXTRACT",
                          style: TextStyle(
                            color: Color(0xFF181825),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20), // Space between buttons
                      ElevatedButton(
                        onPressed: controller.resetNIC,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFA6E3A1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          "RESET",
                          style: TextStyle(
                            color: Color(0xFF181825),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40), // Adjusted bottom spacing
                ],
              ),
            ),

            /// "Developed by" section at the bottom with a clickable GitHub link.
            Column(
              children: [
                const Text(
                  "Developed by",
                  style: TextStyle(color: Color(0xFF9399B2), fontSize: 16),
                ),
                GestureDetector(
                  onTap: _launchURL, // Open GitHub profile when tapped
                  child: const Text(
                    "AchiraNadeeshan",
                    style: TextStyle(
                      color: Color(0xFFA6E3A1),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Space from the bottom
              ],
            ),
          ],
        ),
      ),
    );
  }
}
