import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/nic_decoder.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var nicDetails = {}.obs;
  final textController = TextEditingController();

  // @override
  // void onInit() {
  //   super.onInit();
  //   // Set test NIC and update state
  //   String testNIC = "697811249V";
  //   textController.text = testNIC;
  //   nicNumber.value = testNIC;

  //   // Listen for changes in textController and update nicNumber accordingly
  //   textController.addListener(() {
  //     nicNumber.value = textController.text;
  //     update(); // Force UI update
  //   });

  //   update(); // Ensure UI refreshes after setting initial value
  // }

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

  void resetNIC() {
    nicNumber.value = '';
    textController.clear(); // Clears the input field visually
  }
}
