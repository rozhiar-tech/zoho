import 'package:get/get.dart';

import '../controllers/single_job_controller.dart';

class SingleJobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleJobController>(
      () => SingleJobController(),
    );
  }
}
