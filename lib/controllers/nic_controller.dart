import 'package:get/get.dart';
import '../utils/nic_decoder.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var nicDetails = {}.obs;

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
}
