import 'package:get/get.dart';

import '../controllers/view_candidates_controller.dart';

class ViewCandidatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewCandidatesController>(
      () => ViewCandidatesController(),
    );
  }
}
