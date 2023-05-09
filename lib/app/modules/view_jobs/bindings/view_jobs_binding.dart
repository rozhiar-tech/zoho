import 'package:get/get.dart';

import '../controllers/view_jobs_controller.dart';

class ViewJobsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewJobsController>(
      () => ViewJobsController(),
    );
  }
}
