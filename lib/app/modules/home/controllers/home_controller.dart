import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxString title = 'Home'.obs;
  RxBool search = false.obs;

  searchIsClicked() {
    search.value = !search.value;
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
