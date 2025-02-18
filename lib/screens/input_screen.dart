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
      appBar: AppBar(title: const Text("Sri Lankan NIC Details Extractor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NICInputField(controller: controller),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.decodeNIC,
              child: const Text("Extract Details"),
            ),
          ],
        ),
      ),
    );
  }
}
