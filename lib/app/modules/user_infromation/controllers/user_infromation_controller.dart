import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zoho/app/routes/app_pages.dart';

class UserInfromationController extends GetxController {
  var username;
  var password;
  var email;
  var phone;
  var pictureUrl;
  var gender;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pictureUrlController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  RxString registerTitle = 'Fill Out Your Information'.obs;

  register() async {
    username = usernameController.text;
    password = passwordController.text;
    email = emailController.text;
    phone = phoneController.text;
    pictureUrl = pictureUrlController.text;
    gender = genderController.text;

    // check username is between 3 and 35 characters
    if (username.length < 3 || username.length > 35) {
      Get.snackbar('Error', 'Username must be between 3 and 35 characters');
      return;
    }

    // check if phone is 11 characters
    if (phone.length != 11) {
      Get.snackbar('Error', 'Phone must be like 07701231234');
      return;
    }

    // check if pictureUrl is empty
    if (pictureUrl.isEmpty) {
      Get.snackbar('Error', 'Please fill pictureUrl field with a link or anything');
      return;
    }

    print(gender != 'male');
    // gender must be either male or female 
    if (gender != 'male' && gender != 'female') {
      Get.snackbar('Error', 'gender must me either male or female');
      return;
    }

    // print(username);
    // print(password);
    // print(email);
    // print(phone);
    // print(pictureUrl);
    // print(gender);
    var body = json.encode({
      'username': username,
      'password': password,
      'email': email,
      'phone': phone,
      'picture_url': pictureUrl,
      'gender': gender,
    });
    // print(body);

    final response = await http.post(
      Uri.parse('http://52.20.124.191:4000/api/student'),
      headers: {"content-type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'You have successfully registered');
      Get.offAllNamed(Routes.LOGIN);
      return;
    }

    Get.snackbar('Error', response.body);
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    password = Get.arguments['password'];
    // print('email: $email and password: $password');
    emailController.text = email;
    passwordController.text = password;
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
