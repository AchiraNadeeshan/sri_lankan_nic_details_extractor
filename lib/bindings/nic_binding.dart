import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class NICBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NICController>(() => NICController());
  }
}
