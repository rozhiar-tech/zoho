import 'package:get/get.dart';

import '../controllers/flitered_jobs_controller.dart';

class FliteredJobsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FliteredJobsController>(
      () => FliteredJobsController(),
    );
  }
}
