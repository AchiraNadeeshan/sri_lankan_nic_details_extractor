import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../widgets/result_card.dart';

/// The result screen displaying the extracted NIC details.
///
/// This screen retrieves the decoded NIC details from the [NICController]
/// and presents them using a list of [ResultCard] widgets.
class ResultScreen extends StatelessWidget {
  /// Creates an instance of [ResultScreen].
  ResultScreen({super.key});

  /// Controller for managing NIC details.
  final NICController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181825), // Custom background color
      body: Center(
        child: SingleChildScrollView(
          // Enables scrolling for smaller screens
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center content vertically
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center content horizontally
              children: [
                /// Title of the result screen.
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: const Text(
                    "NIC Details",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA6E3A1),
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Spacing below the title

                /// List of result cards displaying NIC details.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: controller.nicDetails.entries
                      .map((e) =>
                          ResultCard(title: e.key, value: e.value.toString()))
                      .toList(),
                ),
                const SizedBox(height: 50), // Spacing before the button

                /// Button to navigate back to the input screen.
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA6E3A1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'GO BACK',
                    style: TextStyle(
                      color: Color(0xFF181825),
                      fontWeight: FontWeight.bold,
                    ),
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
