import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoho/app/data/models/company_model.dart';
import 'package:zoho/app/data/models/student_model.dart';
import 'package:zoho/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString loginTitle = 'Login'.obs;

  RxList users = [].obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  // Future fetchStudents() async {
  //   try {
  //     final response = await http.get(Uri.parse('http://52.20.124.191:4000/api/students'), headers: {"Accept": "application/json"});

  //     if (response.statusCode == 200) {
  //       users.value = json.decode(response.body);
  //       print(users);
  //     } else {
  //       print('Error');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future login() async {
    // get email and password fields
    var email = emailController.text;
    var password = passwordController.text;

    // check if email and password are empty
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }
    
    // check if password is more than 6 characters and less than 35 characters
    if (password.length < 8 || password.length > 35) {
      Get.snackbar('Error', 'Password must be between 6 and 35 characters');
      return;
    }
    
    //check if email ends with '@komar.edu.iq'
    if (email.endsWith('@komar.edu.iq')) {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
      } on Exception catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }

    // print('email: $email');
    // print('password: $password');

    try {

      final response = await http.get(
        Uri.parse('http://52.20.124.191:4000/api/login/$email/$password'),
        headers: {"content-type": "application/json"},
      );

      if (response.statusCode == 200) {
        Map<dynamic, dynamic> data = jsonDecode(response.body);
        // print(data);
        Map<dynamic, dynamic> user = data['user'];
        // print(user);

        // if data.userType is 'student' store the student object in shared preferences
        if (data['userType'] == 'student') {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // create a student object from the data
          Student student = Student(
            email: user['Email'].toString(),
            gender: user['Gender'].toString(),
            password: user['Password'].toString(),
            phone: user['Phone'].toString(),
            pictureUrl: user['Picture_url'].toString(),
            studentId: user['Student_id'],
            username: user['Username'].toString(),
          );

          // print(student.toJson());

          // store the student object in shared preferences
          prefs.setString('student', jsonEncode(student.toJson()));
          Get.snackbar('Success', 'You are logged in');
          Get.offNamed(Routes.HOME);
          return;
        }

        // if (data.userType == 'company') store the company object in shared preferences
        if (data['userType'] == 'company') {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          // create a company object from the data
          CompanyModel company = CompanyModel(
            companyId: user['Company_id'],
            username: user['Username'].toString(),
            email: user['Email'].toString(),
            phone: user['Phone'].toString(),
            address: user['Address'].toString(),
            password: user['Password'].toString(),
            logo: user['Logo'].toString(),
            description: user['Description'].toString(),
          );

          // print(company.toJson());

          // store the company object in shared preferences
          prefs.setString('company', jsonEncode(company.toJson()));
          Get.snackbar('Success', 'You are logged in');
          Get.offNamed(Routes.COMPANY_HOME);
          return;
        }
      } else {
        // get the error property inside response.body
        var error = json.decode(response.body)['error'];
        Get.snackbar('Error', error);
        return;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  checkIfUserIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? student = prefs.getString('student');
    // get email and password from student object
    if (student == null) {
      return;
    }
    Student studentObj = Student.fromJson(jsonDecode(student));
    String myEmail = studentObj.email.toString();
    String myPassword = studentObj.password.toString();

    if (student != '') {
      print('email: $myEmail password: $myPassword');
      await auth.signInWithEmailAndPassword(email: myEmail, password: myPassword);
      Get.offNamed(Routes.HOME);
    }

    String? company = prefs.getString('company');

    if (company != null) {
      Get.offNamed(Routes.COMPANY_HOME);
    }
  }

  register() {
    Get.offNamed('/sign-up');
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    // await fetchStudents();
    checkIfUserIsLoggedIn();
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
