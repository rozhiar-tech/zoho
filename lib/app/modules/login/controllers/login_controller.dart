import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoho/app/modules/login/controllers/users.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString LoginTitle = 'Login'.obs;
  RxList users = [].obs;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future fetchStudents() async {
    try {
      final response = await http.get(
          Uri.parse('http://10.0.2.2:3000/api/students'),
          headers: {"Accept": "application/json"});

      if (response.statusCode == 200) {
        users.value = json.decode(response.body);
      } else {
        print('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  Future login() async {
    try {
      users.forEach((element) async {
        if (element['Email'] == emailController.text &&
            element['Password'] == passwordController.text) {
          await auth.signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('email', emailController.text);
          Get.offNamed('/home');
        } else {
          Get.snackbar('Error', 'Invalid Credentials');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  checkIfUserIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    if (email != null) {
      Get.offNamed('/home');
    }
  }

  register() {
    Get.offNamed('/sign-up');
  }

  final count = 0.obs;
  @override
  void onInit() async {
    await fetchStudents();
    checkIfUserIsLoggedIn();
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
