import 'package:get/get.dart';

class AllJobsController extends GetxController {
  //TODO: Implement AllJobsController
  RxString title = 'Product Designer'.obs;
  RxString salary = "10k - 20k/month".obs;
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
