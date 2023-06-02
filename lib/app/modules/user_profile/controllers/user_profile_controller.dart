import 'dart:convert';

import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoho/app/data/models/student_model.dart';

class UserProfileController extends GetxController {
  
  RxString ProfileName = 'Profile'.obs;

  RxString email = ''.obs;
  Rx<Student> student = Student().obs;

  getUserInfo() async {
    // get the student object from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var studentString = prefs.getString('student');
    // check if the student object is null
    if(studentString != null) {
      student.value = Student.fromJson(jsonDecode(studentString));
      return;
    }

    Get.snackbar('Error', 'we could not find the student object'); 
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
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
