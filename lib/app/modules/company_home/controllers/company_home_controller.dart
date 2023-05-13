import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyHomeController extends GetxController {
  //TODO: Implement CompanyHomeController
  RxString title = 'Company Home'.obs;

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
