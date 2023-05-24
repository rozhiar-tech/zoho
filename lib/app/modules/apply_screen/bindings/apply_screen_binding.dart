import 'package:get/get.dart';

import '../controllers/apply_screen_controller.dart';

class ApplyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplyScreenController>(
      () => ApplyScreenController(),
    );
  }
}
