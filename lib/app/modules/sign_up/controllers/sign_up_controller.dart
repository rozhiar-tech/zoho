import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxString registerTitle = 'Register'.obs;
  User? user = FirebaseAuth.instance.currentUser;

  Future register() async {
    var email = emailController.text;
    var password = passwordController.text;
    var confirmPassword = confirmPasswordController.text;

    // check if email and password are empty
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // // check if email ends with '@komar.edu.iq'
    // if (!email.endsWith('@komar.edu.iq')) {
    //   Get.snackbar('Error', 'the eamil must end with @komar.edu.iq', snackPosition: SnackPosition.BOTTOM);
    //   return;
    // }

    // check if password is more than 6 characters and less than 35 characters
    if ((password.length < 8 || password.length > 35) || (confirmPassword.length < 8 || confirmPassword.length > 35)) {
      Get.snackbar('Error', 'Password must be between 6 and 35 characters', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // check if password and confirm password are the same
    if (password != confirmPassword) {
      Get.snackbar('Error', 'Password and confirm password must be the same', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Get.offAllNamed('/confirm-email', arguments: {'email': email, 'password': password});
    // return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      User? user = FirebaseAuth.instance.currentUser;
      user!.reload();
      user.sendEmailVerification();

      Get.snackbar('Success', 'Account created successfully', snackPosition: SnackPosition.BOTTOM);
      Get.offAllNamed('/confirm-email', arguments: {'email': email, 'password': password, 'confirmPassword': confirmPassword});

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.', snackPosition: SnackPosition.BOTTOM);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

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
}
