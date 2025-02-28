import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

/// A binding class that manages the dependencies for the NIC module.
///
/// This class is responsible for lazily initializing the [NICController]
/// using GetX dependency injection.
class NICBinding extends Bindings {
  @override
  void dependencies() {
    /// Lazily puts an instance of [NICController] into memory when needed.
    Get.lazyPut<NICController>(() => NICController());
  }
}
