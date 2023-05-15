import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxString registerTitle = 'Register'.obs;
  User? user = FirebaseAuth.instance.currentUser;

  Future register() async {
    if (emailController.text.contains('@') &&
        emailController.text.split('@')[1].endsWith('komar.edu.iq')) {
      if (passwordController.text == confirmPasswordController.text) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
          Get.snackbar('Success', 'Account created successfully',
              snackPosition: SnackPosition.BOTTOM);
          Get.offAllNamed('/confirm-email');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.snackbar('Error', 'The password provided is too weak.',
                snackPosition: SnackPosition.BOTTOM);
          } else if (e.code == 'email-already-in-use') {
            Get.snackbar('Error', 'The account already exists for that email.',
                snackPosition: SnackPosition.BOTTOM);
          }
        } catch (e) {
          print(e);
        }
      } else {
        Get.snackbar('Error', 'Password does not match',
            snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar('Error', 'Please enter a valid email',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
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
