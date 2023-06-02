import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_infromation_controller.dart';

class UserInfromationView extends GetView<UserInfromationController> {
  const UserInfromationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: UserInfromationController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: Get.height * 0.3,
                      width: Get.width,
                      child: Center(
                        child: Text(
                          controller.registerTitle.value,
                          style: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height * 0.9,
                      width: Get.width,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width * 0.8,
                            child: TextFormField(
                              controller: controller.usernameController,
                              decoration: InputDecoration(
                                hintText: 'User Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: Get.width * 0.8,
                            child: TextFormField(
                              controller: controller.passwordController,
                              enabled: false,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: Get.width * 0.8,
                            child: TextFormField(
                              controller: controller.emailController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                enabled: false,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: Get.width * 0.8,
                            child: TextFormField(
                              controller: controller.phoneController,
                              decoration: InputDecoration(
                                hintText: 'Phone',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: Get.width * 0.8,
                            child: TextFormField(
                              controller: controller.pictureUrlController,
                              decoration: InputDecoration(
                                hintText: 'Picture url',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: Get.width * 0.8,
                            child: TextFormField(
                              controller: controller.genderController,
                              decoration: InputDecoration(
                                hintText: 'Gender',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          // Container(
                          //   width: Get.width * 0.8,
                          //   child: Icon(
                          //     Icons.photo_library_outlined,
                          //     size: 60,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: Get.width * 0.8,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.register();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 255, 189, 74),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text('Register'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
