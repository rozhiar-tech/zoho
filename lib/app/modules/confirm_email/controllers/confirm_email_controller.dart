import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoho/app/routes/app_pages.dart';

class ConfirmEmailController extends GetxController {
  var email;
  var password;

  late Timer timer;
  RxString confirmEmailTitle = 'Please check your email to verify your account'.obs;

  Future verifyEmail() async {
    // Get.offAllNamed(Routes.USER_INFROMATION, arguments: {'email': email, 'password': password});
    // return;

    User? user = FirebaseAuth.instance.currentUser;
    await user!.reload();
    if (user.emailVerified) {
      Get.snackbar(
        'Success',
        'Email verified successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      );
      Get.toNamed(Routes.USER_INFROMATION, arguments: {'email': email, 'password': password});
    } else {
      Get.snackbar('Error', 'Please verify your email', snackPosition: SnackPosition.BOTTOM);
    }
  }

  // create resendEmail function
  Future resendEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.reload();
    user.sendEmailVerification();
    Get.snackbar(
      'Email sent successfully',
      'Check your inbox or your spam folder and verify the email',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),  
    );
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    password = Get.arguments['password'];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
