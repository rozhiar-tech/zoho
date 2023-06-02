import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoho/app/data/models/question_model.dart';
import 'package:zoho/app/data/models/student_model.dart';
import 'package:zoho/app/routes/app_pages.dart';

class ApplyScreenController extends GetxController {
  RxString jobTitle = 'Apply'.obs;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  RxString email = ''.obs;
  RxString cvName = ''.obs;

  FilePickerResult? pickedFile;

  var job;
  var company;
  RxList<Question> questions = <Question>[].obs;
  var controllers = <TextEditingController>[].obs;

  var cvUrl = '';

  pickCVFile() async {
    pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    File fileName = File(pickedFile!.files.single.name);
    cvName.value = fileName.toString();
  }

  Future<void> submitApplication() async {
    for (var i = 0; i < questions.length; i++) {
      if (controllers[i].text.isEmpty) {
        Get.snackbar(
          'Error',
          'Please answer all questions',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
    }

    if (pickedFile == null) {
      Get.snackbar(
        'Error',
        'Please upload your CV',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    var jobId = job.jobId.toString();

    var studentId = await getStudentId();

    File file = File(pickedFile!.files.single.path!);
    File fileName = File(pickedFile!.files.single.name);
    await storage.ref('${email.value}/${fileName}').putFile(file);
    cvUrl = await storage.ref('${email.value}/${fileName}').getDownloadURL();

    // print('studentId: $studentId | jobId: $jobId | cvUrl: $cvUrl');

    final response = await http.post(
      Uri.parse('http://52.20.124.191:4000/api/application'),
      headers: {"content-type": "application/json"},
      body: jsonEncode({
        "student_id": studentId,
        "job_id": jobId,
        "cv_link": cvUrl,
      }),
    );
    // check for errors
    if (response.statusCode != 200) {
      Get.snackbar(
        'Error',
        response.body,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // print(response.body);
    Map<dynamic, dynamic> data = jsonDecode(response.body);
    var applicationId = data['insertId'];
    // print('applicationId: $applicationId');

    // save the answers of the questions in the database
    for (var i = 0; i < questions.length; i++) {
      final response = await http.post(
        Uri.parse('http://52.20.124.191:4000/api/application_data'),
        headers: {"content-type": "application/json"},
        body: jsonEncode({
          "application_id": applicationId,
          "question_id": questions[i].questionId,
          "answer": controllers[i].text,
        }),
      );
      // print(response.body);
      if (response.statusCode != 200) {
        Get.snackbar(
          'Failed to save answers',
          response.body,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
    }
    Get.snackbar(
      'Success',
      'Your application has been submitted',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.offAllNamed(Routes.HOME);
  }

  getStudentId() async {
    // get student id from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Student student = Student.fromJson(jsonDecode(prefs.getString('student')!));
    return student.studentId;
  }

  Future getQuestions() async {
    final response = await http.get(
      Uri.parse('http://52.20.124.191:4000/api/questions_for_job/${job.jobId.toString()}'),
      headers: {"content-type": "application/json"},
    );
    var myQuestions = (jsonDecode(response.body) as List).map((e) => Question.fromJson(e)).toList();

    // add a controller for each question
    for (var i = 0; i < myQuestions.length; i++) {
      controllers.add(TextEditingController());
    }
    questions.value = myQuestions;
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    job = Get.arguments[0];
    company = Get.arguments[1];

    jobTitle.value = job.title.toString();

    if (user != null) {
      email.value = user!.email!;
    }

    await getQuestions();
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
