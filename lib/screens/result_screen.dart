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
      appBar: AppBar(title: const Text("NIC Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.nicDetails.entries
              .map((e) => ResultCard(title: e.key, value: e.value.toString()))
              .toList(),
        ),
      ),
    );
  }
}
