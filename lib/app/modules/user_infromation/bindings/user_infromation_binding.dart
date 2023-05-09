import 'package:get/get.dart';

import '../controllers/user_infromation_controller.dart';

class UserInfromationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInfromationController>(
      () => UserInfromationController(),
    );
  }
}
