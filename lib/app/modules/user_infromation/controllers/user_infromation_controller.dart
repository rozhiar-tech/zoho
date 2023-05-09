import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserInfromationController extends GetxController {
  //TODO: Implement UserInfromationController
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxString registerTitle = 'Fill Out Your Information'.obs;

  final count = 0.obs;
  register() {
    print(emailController.text);
    print(passwordController.text);
    print(confirmPasswordController.text);
    Get.offNamed('/home');
  }

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
