import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX(
          init: HomeController(),
          builder: (controller) {
            return Scaffold(
                body: Container(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: Get.height * 0.12,
                    width: Get.width,
                    child: Container(
                      height: Get.height * 0.33,
                      width: Get.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () {
                                controller.searchIsClicked();
                              },
                              child: Image.asset(
                                'assets/images/filter.png',
                                height: Get.height * 0.1,
                                width: Get.width * 0.1,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          controller.search.value
                              ? AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xffF8F4EC),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Search'),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.09,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xffF8F4EC),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                        onPressed: () {
                                          controller.searchIsClicked();
                                        },
                                        icon: Icon(Icons.search)),
                                  ),
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/images/splash.jpg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.44,
                    width: Get.width,
                    color: Colors.blue,
                    child: Text(controller.title.value),
                  ),
                  Container(
                    height: Get.height * 0.38,
                    width: Get.width,
                    color: Colors.green,
                  ),
                ]),
              ),
            ));
          }),
    );
  }
}
