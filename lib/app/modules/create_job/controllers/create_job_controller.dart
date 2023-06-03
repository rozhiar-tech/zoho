import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zoho/app/data/models/department_model.dart';

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

  RxList<String> departments = <String>[].obs;
  List<Department> myDepartments = [];

  int companyId = 0;

  var controllers = <TextEditingController>[].obs;

  addTextFormField() {
    textFormFieldList.add(TextFormField());
    controllers.add(TextEditingController());
    height.value = height.value + 70;
  }

  removeTextFormField(int index) {
    textFormFieldList.removeAt(index);
    controllers.removeAt(index);
    height.value = height.value - 70;
  }

  void createJob() async {
    var title = jobTitleController.text;
    var description = jobDescriptionController.text;
    var companyId = jobCompanyIdController.text;
    var type = jobTypeController.text;
    var gender = jobGenderController.text;
    var expiration = jobExpirationController.text;

    // find the department and get it's id
    var departmentId = 0;
    for (var element in myDepartments) {
      if (element.name == jobDepartmentIdController.text) {
        departmentId = (element.departmentId)!;
        break;
      }
    }

    // send the data to the server
    final response = await http.post(
      Uri.parse('http://52.20.124.191:4000/api/job'),
      headers: {"content-type": "application/json"},
      body: jsonEncode({
        'title': title,
        'description': description,
        'company_id': companyId,
        'type': type,
        'gender': gender,
        'expiration': expiration,
        'department_id': departmentId,
      }),
    );
    // print(response.body);
    if (response.statusCode == 200) {
      Get.snackbar(
        'Job Created',
        'Job Created Successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // print(jsonDecode(response.body)['insertId']);
      await insertQuestions(jsonDecode(response.body)['insertId']);
      Get.back();
      return;
    }
    Get.snackbar(
      'Error',
      response.body,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  Future insertQuestions(int jobId) async {
    for (var i = 0; i < controllers.length; i++) {
      print(controllers[i].text);
      final response = await http.post(
        Uri.parse('http://52.20.124.191:4000/api/question'),
        headers: {"content-type": "application/json"},
        body: jsonEncode({
          'text': controllers[i].text,
          'job_id': jobId,
        }),
      );
      if (response.statusCode != 200) {
        Get.snackbar(
          'Error',
          'Question Creation Failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print(response.body);
        return;
      }
    }
  }

  fetchDepartments() async {
    // get all the jobs for the company from the server
    final response = await http.get(
      Uri.parse('http://52.20.124.191:4000/api/departments'),
      headers: {"content-type": "application/json"},
    );
    myDepartments = (jsonDecode(response.body) as List).map((e) => Department.fromJson(e)).toList();
    myDepartments.forEach((element) {
      departments.add(element.name.toString());
    });
    print(departments);
  }

  @override
  void onInit() async {
    super.onInit();
    companyId = Get.arguments;
    jobCompanyIdController.text = companyId.toString();
    await fetchDepartments();
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
