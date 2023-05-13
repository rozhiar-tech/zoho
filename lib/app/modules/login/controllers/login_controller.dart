import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString LoginTitle = 'Login'.obs;

  login() {
    if (emailController.text == 'admin' && passwordController.text == 'admin') {
      Get.offNamed('/company-home');
    } else {
      // Get.snackbar('Error', 'Invalid Credentials');
      Get.offNamed('/home');
    }
  }

  register() {
    Get.offNamed('/sign-up');
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
