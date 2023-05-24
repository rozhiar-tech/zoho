import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ApplyScreenController extends GetxController {
  //TODO: Implement ApplyScreenController
  RxString ApplyScreenTitle = 'Apply'.obs;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser!;

  RxString email = ''.obs;

  Future<File?> pickCVFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      File fileName = File(result.files.single.name);
      storage.ref('${email.value}/${fileName}').putFile(file);
      Get.defaultDialog(
        title: 'Success',
        middleText: """Your CV has been uploaded 
        successfully.""",
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          child: Text('OK'),
        ),
      );
      return file;
    } else {
      return null;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    email.value = user.email!;
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
