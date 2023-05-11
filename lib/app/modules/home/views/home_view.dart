import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

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
                backgroundColor: Color(0xffF8F8F8),
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
                                    Get.toNamed('/filter-page');
                                  },
                                  child: Image.asset(
                                    'assets/images/filter.png',
                                    height: Get.height * 0.08,
                                    width: Get.width * 0.08,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 700),
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
                                        hintText: 'Search here...'),
                                  ),
                                ),
                              ),
                              // : Container(
                              //     height: Get.height * 0.05,
                              //     width: Get.width * 0.09,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(50),
                              //       // color: Color(0xffF8F4EC),
                              //     ),
                              //     child: Center(
                              //       child: IconButton(
                              //           onPressed: () {
                              //             controller.searchIsClicked();
                              //           },
                              //           icon: Icon(Icons.search)),
                              //     ),
                              //   ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed('/user-profile');
                                  },
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/images/splash.jpg'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height * 0.44,
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.title.value,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffBAE5F5),
                                    ),
                                    height: Get.height * 0.27,
                                    width: Get.width * 0.5,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: Get.height * 0.1,
                                          width: Get.width * 0.2,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: const Color(0xffF8F4EC),
                                          ),
                                          child: const Icon(
                                            Icons.work_outline,
                                            size: 40,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          '48.4k',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Remote Jobs',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: Get.height * 0.14,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffE2D3FE),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: Get.height * 0.06,
                                              width: Get.width * 0.13,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Color(0xffF8F4EC),
                                              ),
                                              child: const Icon(
                                                Icons.compare_arrows,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                '48.4k',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Full Time',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: Get.height * 0.14,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffCCF0C0),
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: Get.height * 0.06,
                                              width: Get.width * 0.13,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Color(0xffF8F4EC),
                                              ),
                                              child: Icon(
                                                Icons.compare_sharp,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '48.4k',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Part Time',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Get.toNamed('/create-job');
                                },
                                child: Text('See All'))
                          ],
                        ),
                      ),
                      Container(
                        height: Get.height * 0.38,
                        width: Get.width,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Recent Jobs',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      Get.toNamed('/all-jobs');
                                    },
                                    child: Text(
                                      'See All',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: Get.height * 0.30,
                              width: Get.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 13, vertical: 5),
                                      child: Container(
                                        height: Get.height * 0.16,
                                        width: Get.width * 0.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/google.png'),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Product Designer',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      '10k - 20k/month',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: Get.height * 0.06,
                                                    width: Get.width * 0.13,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: Color(0xffE2D3FE),
                                                    ),
                                                    child: Icon(
                                                      Icons.bookmark_border,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Container(
                                                    height: Get.height * 0.03,
                                                    width: Get.width * 0.3,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: Color(0xffE2D3FE),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Senior ',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  height: Get.height * 0.03,
                                                  width: Get.width * 0.3,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color: Color(0xffE2D3FE),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Full Time',
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: Get.height * 0.03,
                                                    width: Get.width * 0.16,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color: Color(0xffE2D3FE),
                                                    ),
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Get.toNamed(
                                                            '/single-job');
                                                      },
                                                      child: Text(
                                                        'Apply',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xffFDE1AA),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
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
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ));
          }),
    );
  }
}
