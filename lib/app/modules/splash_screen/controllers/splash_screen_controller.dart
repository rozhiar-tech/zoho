import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement
  RxString title = 'Zoho'.obs;

  final count = 0.obs;
  void getToHome() async {
    await Future.delayed(Duration(seconds: 7));
    Get.offAllNamed('/login');
  }

  @override
  void onInit() {
    print('onInit');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady');
    getToHome();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
