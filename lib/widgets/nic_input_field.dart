import 'package:flutter/material.dart';
import '../controllers/nic_controller.dart';

class NICInputField extends StatelessWidget {
  final NICController controller;
  const NICInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.textController, // Bind controller to input field
      onChanged: (value) => controller.nicNumber.value = value.toUpperCase(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius:
              BorderRadius.circular(20), // Wounded look with rounded corners
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey, width: 2), // Highlight color on focus
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.grey, width: 2), // Default border color
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Enter NIC Number",
      ),
    );
  }
}
