import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateJobController extends GetxController {
  //TODO: Implement CreateJobController

  RxList TextFormFieldList = [].obs;

  addTextFormField() {
    TextFormFieldList.add(TextFormField());
  }
  removeTextFormField(int index) {
    TextFormFieldList.removeAt(index);
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
