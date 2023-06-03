import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zoho/app/data/models/job_model_model.dart';
import 'package:zoho/app/data/models/student_model.dart';


import '../../../data/models/application_model.dart';

class ViewCandidatesController extends GetxController {

  RxList<Application> applications = <Application>[].obs;
  final count = 0.obs;
  RxString title = 'View Candidates'.obs;
  JobModel job = JobModel();

  RxList<Student> students = <Student>[].obs;
  List<int> studentIds = [];

  Future getApplicationsWithId(id) async {

    final response = await http.get(
      Uri.parse('http://52.20.124.191:4000/api/applications_for_job/$id'),
      headers: {"content-type": "application/json"},
    );

    if (response.statusCode == 200) {
      var myApplications = (jsonDecode(response.body) as List).map((e) => Application.fromJson(e)).toList();
      // if no applications are found
      if (myApplications.isEmpty) {
        Get.snackbar(
          'No Applications',
          'No applications found for this job',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      // get the student ids from the applications
      for (var i = 0; i < myApplications.length; i++) {
        studentIds.add(myApplications[i].studentId!);
      }
      // print(studentIds);
      await getStudentsByIds(studentIds);
      applications.value = myApplications;
    } else {
      // print(response.body);
      Get.snackbar('Error', response.body);
    }
  }

  viewCv(String url) async {
    Uri uri = Uri.parse(url);
    Get.snackbar('View CV', 'View CV will be implemented soon', backgroundColor: Colors.green, colorText: Colors.white);
  }

  Future getStudentsByIds(ids) async {
    final response = await http.post(
      Uri.parse('http://52.20.124.191:4000/api/students_by_ids'),
      headers: {"content-type": "application/json"},
      body: jsonEncode({
        "ids": ids,
      }),
    );
    if (response.statusCode == 200) {
      students.value = (jsonDecode(response.body) as List).map((e) => Student.fromJson(e)).toList();
      // print(students);
    } else {
      // print(response.body);
      Get.snackbar('Error', response.body);
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    job = Get.arguments[0];
    await getApplicationsWithId(job.jobId);
    // print(applications);
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

  // void complete(PDFViewController pdfViewController) {}
}
