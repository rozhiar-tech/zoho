import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPageController extends GetxController {
  //TODO: Implement FilterPageController

  final count = 0.obs;
  RangeValues values = RangeValues(0, 100);
  RxDouble minValue = 0.0.obs;
  RxDouble maxValue = 100.0.obs;

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
