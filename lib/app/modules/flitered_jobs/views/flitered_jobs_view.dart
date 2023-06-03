import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flitered_jobs_controller.dart';

class FliteredJobsView extends GetView<FliteredJobsController> {
  const FliteredJobsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: FliteredJobsController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  controller.titleText.value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                backgroundColor: const Color(0xffF7F7F7),
                elevation: 0,
              ),
              body: Container(
                height: Get.height,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: Get.height * 0.30,
                    width: Get.width,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.jobs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                          child: Container(
                            height: Get.height * 0.16,
                            width: Get.width * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.companyDetails(index);
                                        },
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(controller.companies[index].logo.toString()), //get the company image
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.jobs[index].title.toString(),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          controller.jobs[index].type.toString(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: Get.height * 0.06,
                                        width: Get.width * 0.13,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: const Color(0xffE2D3FE),
                                        ),
                                        child: const Icon(
                                          Icons.bookmark_border,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Container(
                                        height: Get.height * 0.03,
                                        // width: Get.width * 0.16,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: const Color(0xffE2D3FE),
                                        ),
                                        child: Center(
                                          child: Text(
                                            controller.jobs[index].gender.toString(),
                                            style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: Get.height * 0.03,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xffE2D3FE),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Ends in ${controller.jobs[index].expiration.toString()}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: Get.height * 0.03,
                                        // width: Get.width * 0.16,
                                        // padding: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: const Color(0xffE2D3FE),
                                        ),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller.goToJobDetails(index);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            backgroundColor: Color.fromARGB(255, 248, 206, 122),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: const Text(
                                            'Apply',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ));
        });
  }
}
