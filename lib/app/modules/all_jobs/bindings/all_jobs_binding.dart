import 'package:get/get.dart';

import '../controllers/all_jobs_controller.dart';

class AllJobsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllJobsController>(
      () => AllJobsController(),
    );
  }
}
