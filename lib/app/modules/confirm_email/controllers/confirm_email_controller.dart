import 'dart:async';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConfirmEmailController extends GetxController {
  //TODO: Implement ConfirmEmailController
  late Timer timer;
  RxString confirmEmailTitle =
      'Please check your email to verify your account'.obs;

  Future verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    await user!.reload();
    if (user.emailVerified) {
      print("verified");
      Get.snackbar('Success', 'Email verified successfully',
          snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed('/login');
    } else {
      Get.snackbar('Error', 'Please verify your email',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  final count = 0.obs;

  @override
  void onInit() {
    User? user = FirebaseAuth.instance.currentUser;
    user!.reload();
    user.sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {});
    super.onInit();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void onReady() async {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      // print("hey");
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
