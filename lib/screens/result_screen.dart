import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../widgets/result_card.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});
  final NICController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181825), // Custom background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: const Text(
                "NIC Details",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA6E3A1), // Title color updated to #A6E3A1
                ),
              ),
            ),
            // Details section
            const SizedBox(height: 40), // Spacing between title and details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.nicDetails.entries
                  .map((e) =>
                      ResultCard(title: e.key, value: e.value.toString()))
                  .toList(),
            ),

            const SizedBox(height: 50), // Space between details and back button

            ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text('GO BACK'),
            ),
          ],
        ),
      ),
    );
  }
}
