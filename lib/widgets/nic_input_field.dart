import 'package:flutter/material.dart';
import '../controllers/nic_controller.dart';

class NICInputField extends StatefulWidget {
  final NICController controller;

  const NICInputField({super.key, required this.controller});

  @override
  _NICInputFieldState createState() => _NICInputFieldState();
}

class _NICInputFieldState extends State<NICInputField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Listen for focus changes
    _focusNode.addListener(() {
      setState(() {}); // Trigger rebuild when focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    _focusNode.dispose(); // Clean up focus node
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400, // Input box width
      child: TextField(
        controller: widget.controller.textController,
        onChanged: (value) =>
            widget.controller.nicNumber.value = value.toUpperCase(),
        focusNode: _focusNode,
        style: TextStyle(
          color: _focusNode.hasFocus ? const Color(0xFFCDD6F4) : Colors.grey,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFFCDD6F4), width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "Enter NIC Number",
          labelStyle: TextStyle(
            color: _focusNode.hasFocus ? const Color(0xFFCDD6F4) : Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        cursorColor: const Color(0xFFCDD6F4),
      ),
    );
  }
}
