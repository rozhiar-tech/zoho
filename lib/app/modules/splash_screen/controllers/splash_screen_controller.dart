import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoho/app/data/models/student_model.dart';
import 'package:zoho/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  RxString title = 'Zoho'.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  checkIfUserIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? company = prefs.getString('company');

    if (company != null) {
      print('going to company home');
      await Future.delayed(const Duration(seconds: 3));
      Get.offNamed(Routes.COMPANY_HOME);
      return;
    }

    String? student = prefs.getString('student');
    // get email and password from student object
    if (student != null) {
      Student studentObj = Student.fromJson(jsonDecode(student));
      String myEmail = studentObj.email.toString();
      String myPassword = studentObj.password.toString();

      if (student != '') {
        // print('email: $myEmail password: $myPassword');
        print('going to home');
        await auth.signInWithEmailAndPassword(email: myEmail, password: myPassword);
        await Future.delayed(const Duration(seconds: 3));
        Get.offNamed(Routes.HOME);
        return;
      }
    }

    print('going to login');

    getToLogin();
  }

  void getToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed('/login');
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    checkIfUserIsLoggedIn();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
