import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../widgets/nic_input_field.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});
  final NICController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 200), // Adjusted top padding for title
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Sri Lankan\nNIC Details Extractor",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 80), // Space between title and input field
            NICInputField(controller: controller),
            const SizedBox(height: 20), // Space between input field and button
            ElevatedButton(
              onPressed: controller.decodeNIC,
              child: const Text("EXTRACT"),
            ),
            const SizedBox(height: 50), // Adjusted bottom spacing
          ],
        ),
      ),
    );
  }
}
