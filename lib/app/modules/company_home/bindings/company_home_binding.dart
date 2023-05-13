import 'package:get/get.dart';

import '../controllers/company_home_controller.dart';

class CompanyHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyHomeController>(
      () => CompanyHomeController(),
    );
  }
}
