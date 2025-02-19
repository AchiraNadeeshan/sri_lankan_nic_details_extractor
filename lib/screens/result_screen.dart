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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title moved down a bit
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: const Text(
                "NIC Details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Details section
            const SizedBox(height: 20), // Spacing between title and details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: controller.nicDetails.entries
                  .map((e) =>
                      ResultCard(title: e.key, value: e.value.toString()))
                  .toList(),
            ),
            // Add space before the back button
            const SizedBox(height: 20), // Space between details and back button
            // Back button placed below the details but not too low
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
