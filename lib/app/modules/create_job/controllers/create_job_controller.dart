import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateJobController extends GetxController {
  RxList textFormFieldList = [].obs;
  RxString title = 'this is a title '.obs;
  RxDouble height = 0.0.obs;

  TextEditingController jobTitleController = TextEditingController();
  TextEditingController jobDescriptionController = TextEditingController();
  TextEditingController jobCompanyIdController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController jobGenderController = TextEditingController();
  TextEditingController jobExpirationController = TextEditingController();
  TextEditingController jobDepartmentIdController = TextEditingController();

  int companyId = 0;

  addTextFormField() {
    textFormFieldList.add(TextFormField());
    height.value = height.value + 65;
  }

  removeTextFormField(int index) {
    textFormFieldList.removeAt(index);
    height.value = height.value - 65;
  }

  void createJob() {}

  @override
  void onInit() {
    super.onInit();
    companyId = Get.arguments;
    jobCompanyIdController.text = companyId.toString();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
