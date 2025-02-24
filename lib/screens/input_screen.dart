import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../widgets/nic_input_field.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import

class InputScreen extends StatelessWidget {
  InputScreen({super.key});
  final NICController controller = Get.find();

  // Function to launch URL
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
                  NICInputField(controller: controller),
                  const SizedBox(
                      height: 20), // Space between input field and buttons
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
            // "Developed by" section at the bottom
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
                      decoration: TextDecoration
                          .underline, // Optional: Underline for the link
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
