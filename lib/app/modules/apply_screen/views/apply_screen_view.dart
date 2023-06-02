import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/apply_screen_controller.dart';

class ApplyScreenView extends GetView<ApplyScreenController> {
  const ApplyScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: ApplyScreenController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  controller.jobTitle.value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                child: SingleChildScrollView(
                  child: Container(
                    height: Get.height * 0.86,
                    child: Column(
                      children: [
                        Container(
                          height: Get.height * 0.6,
                          child: ListView.builder(
                            itemCount: controller.questions.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    // height: Get.height * 0.05,
                                    width: Get.width * 0.9,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[300],
                                    ),
                                    child: Center(
                                      child: Text(
                                        controller.questions[index].text.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Container(
                                    // height: Get.height * 0.05,
                                    width: Get.width * 0.9,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Answer',
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      controller: controller.controllers[index],
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                        controller.cvName.value == ''
                            ? const Text('No CV uploaded')
                            : Container(
                                height: Get.height * 0.05,
                                width: Get.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: Center(
                                  child: Text(
                                    controller.cvName.value,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.pickCVFile();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff222222),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size(Get.width * 0.9, Get.height * 0.07),
                          ),
                          child: const Text('Upload Resume'),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        InkWell(
                          onTap: controller.submitApplication,
                          child: Container(
                            height: Get.height * 0.07,
                            width: Get.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black,
                            ),
                            child: const Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
