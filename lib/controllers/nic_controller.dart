import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/nic_decoder.dart';

/// Controller for managing NIC-related logic in the application.
///
/// This controller handles user input, NIC decoding, and navigation.
/// It uses GetX for state management.
class NICController extends GetxController {
  /// Stores the NIC number entered by the user as an observable string.
  var nicNumber = ''.obs;

  /// Stores the extracted details from the NIC as an observable map.
  var nicDetails = {}.obs;

  /// Text editing controller for the NIC input field.
  final textController = TextEditingController();

  /// Decodes the NIC number entered by the user.
  ///
  /// - If the NIC field is empty, it shows an error message.
  /// - If the NIC is invalid, it displays an invalid NIC message.
  /// - If valid, it extracts the details and navigates to the result screen.
  void decodeNIC() {
    if (nicNumber.value.isEmpty) {
      Get.snackbar("Error", "Please enter a NIC number",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    var result = NICDecoder.decode(nicNumber.value);
    if (result == null) {
      Get.snackbar("Invalid NIC", "Enter a valid NIC number",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    nicDetails.value = result;
    Get.toNamed('/result');
  }

  /// Resets the NIC input field.
  ///
  /// Clears both the observable NIC number and the text field.
  void resetNIC() {
    nicNumber.value = '';
    textController.clear();
  }
}
