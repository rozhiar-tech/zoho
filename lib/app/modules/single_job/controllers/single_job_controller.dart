import 'package:get/get.dart';

class SingleJobController extends GetxController {
  //TODO: Implement SingleJobController

  RxString SingleJobTitle = 'Google'.obs;

  applyJob() {
    Get.offNamed('/apply-screen');
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
