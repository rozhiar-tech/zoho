import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/company_profile_controller.dart';

class CompanyProfileView extends GetView<CompanyProfileController> {
  const CompanyProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX(
        init: CompanyProfileController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                controller.company_text.value,
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
              backgroundColor: Color(0xffF7F7F7),
              elevation: 0,
            ),
            body: Container(
              height: Get.height,
              width: Get.width,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  child: Container(
                    height: Get.height * 0.2,
                    width: Get.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                controller.company_logo.value.toString()),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.company_name.value.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.company_email.value.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                controller.company_phone.value.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                controller.company_address.value.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Company Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    """
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nulla euismod, nisl eget fermentum aliquam, augue nibhultricies tortor, eget ultricies tortor nunc eget augue.Nulla euismod, nisl eget fermentum aliquam, augue nibh
                    """,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Center(
                        child: const Text(
                      'Work with us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
              ]),
            ),
          );
        });
  }
}
