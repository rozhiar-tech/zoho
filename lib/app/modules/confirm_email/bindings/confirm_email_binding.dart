import 'package:get/get.dart';

import '../controllers/confirm_email_controller.dart';

class ConfirmEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmEmailController>(
      () => ConfirmEmailController(),
    );
  }
}
