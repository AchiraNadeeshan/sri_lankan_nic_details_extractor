import 'package:flutter/material.dart';
import '../controllers/nic_controller.dart';

class NICInputField extends StatelessWidget {
  final NICController controller;
  const NICInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => controller.nicNumber.value = value.toUpperCase(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Enter NIC Number",
      ),
    );
  }
}
