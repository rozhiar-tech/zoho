import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPageController extends GetxController {
  //TODO: Implement FilterPageController

  final count = 0.obs;
  RangeValues values = RangeValues(0, 100);
  RxDouble minValue = 0.0.obs;
  RxDouble maxValue = 100.0.obs;
  RxString selectedCategory = 'All'.obs;
  RxString selectedDepartment = 'All'.obs;
  RxString selectedJobType = 'All'.obs;

  getToFilteredJobs(selectedCategory, selectedDepartment, selectedJobType) {
    Get.toNamed('/flitered-jobs', arguments: [
      selectedCategory,
      selectedDepartment,
      selectedJobType,
      minValue.value,
      maxValue.value
    ]);
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
