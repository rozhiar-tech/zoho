import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zoho/app/data/models/department_model.dart';
import 'package:zoho/app/data/models/job_model_model.dart';
import 'package:zoho/app/routes/app_pages.dart';

class FilterPageController extends GetxController {
  final count = 0.obs;
  RangeValues values = RangeValues(0, 100);
  RxDouble minValue = (-1.0).obs;
  RxDouble maxValue = (-1.0).obs;
  RxString selectedGender = 'All'.obs;
  RxString selectedDepartment = 'All'.obs;
  RxString selectedJobType = 'All'.obs;

  TextEditingController searchController = TextEditingController();
  RxList<String> departments = <String>[].obs;
  List<Department> myDepartments = [];

  getToFilteredJobs(selectedGender, selectedDepartment, selectedJobType) async {
    if (selectedGender == 'All') {
      selectedGender = '';
    }
    if (selectedDepartment == 'All') {
      selectedDepartment = '';
    }
    // print(selectedJobType);
    if (selectedJobType == 'All') {
      selectedJobType = '';
    }
    if (searchController.text == '') {
      searchController.text = '';
    }
    // if (minValue.value == -1.0) {
    minValue.value = 0.0;
    // }
    // if (maxValue.value == -1.0) {
    maxValue.value = 0.0;
    // }

    // // print the url with the values attached to it as parameters
    // print('');

    final response = await http.get(
      Uri.parse(
          'http://52.20.124.191:4000/api/filter_jobs?department_id=$selectedDepartment&type=$selectedJobType&search=${searchController.text}&gender=$selectedGender&min_salary=${minValue.value}&max_salary=${maxValue.value}'),
      headers: {"content-type": "application/json"},
    );
    // print(response.body);
    List<JobModel> jobs = (json.decode(response.body) as List).map((e) => JobModel.fromJson(e)).toList();
    Get.toNamed(Routes.FLITERED_JOBS, arguments: jobs);
  }

  Future fetchDepartments() async {
    // get all the jobs for the company from the server
    final response = await http.get(
      Uri.parse('http://52.20.124.191:4000/api/departments'),
      headers: {"content-type": "application/json"},
    );
    myDepartments = (jsonDecode(response.body) as List).map((e) => Department.fromJson(e)).toList();
    myDepartments.forEach((element) {
      departments.add(element.name.toString());
    });
    // print(departments);
  }

  @override
  void onInit() async {
    super.onInit();
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

  void increment() => count.value++;
}
