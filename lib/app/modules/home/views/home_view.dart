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
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                  iconTheme: const IconThemeData(
                    color: Color(0xff000000),
                  ),
                  elevation: 0,
                  backgroundColor: const Color(0xffF8F8F8),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/filter-page');
                      },
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/user-profile');
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/images/splash.jpg'),
                      ),
                    ),
                  ]),
            ),
            drawer: Drawer(
              // backgroundColor: Colors.b,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xffE2D3FE),
                    ),
                    child: Center(
                      child: Text(
                        controller.student.value.username.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {
                      Get.toNamed('/user-profile');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Logout',
                        middleText: 'Are you sure you want to logout?',
                        textConfirm: 'Yes',
                        textCancel: 'No',
                        confirmTextColor: Colors.white,
                        buttonColor: Colors.black,
                        onConfirm: controller.logout,
                        onCancel: () {
                          Get.back();
                        },
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.sunny),
                    title: Text('Dark Mode'),
                    onTap: () {
                      Get.changeThemeMode(
                          Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                    },
                  )
                ],
              ),
            ),
            backgroundColor: const Color(0xffF8F8F8),
            body: Container(
              height: Get.height,
              width: Get.width,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: Get.height * 0.35,
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.title.value,
                            style: const TextStyle(
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
                                  color: const Color(0xffBAE5F5),
                                ),
                                height: Get.height * 0.27,
                                width: Get.width * 0.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: Get.height * 0.1,
                                      width: Get.width * 0.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
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
                                    Text(
                                      controller.jobs.value.length.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Jobs',
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
                                    color: const Color(0xffE2D3FE),
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
                                            color: const Color(0xffF8F4EC),
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
                                        children: [
                                          Text(
                                            controller.fulltimeJobs.value
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
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
                                  height: Get.height * 0.12,
                                  width: Get.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffCCF0C0),
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
                                            color: const Color(0xffF8F4EC),
                                          ),
                                          child: const Icon(
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
                                            controller.parttimeJobs.value
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
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
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.572,
                    width: Get.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 5),
                          child: Row(
                            children: [
                              const Text(
                                'Recent Jobs',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/all-jobs');
                                },
                                child: const Text(
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
                          height: Get.height * 0.45,
                          width: Get.width,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.jobs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 5),
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
                                                controller
                                                    .companyDetails(index);
                                              },
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundImage: NetworkImage(
                                                    controller
                                                        .companies[index].logo
                                                        .toString()), //get the company image
                                                // backgroundImage: AssetImage('assets/images/google.png'),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.jobs[index].title
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                controller.jobs[index].type
                                                    .toString(),
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
                                                borderRadius:
                                                    BorderRadius.circular(50),
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
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Container(
                                              height: Get.height * 0.03,
                                              // width: Get.width * 0.16,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: const Color(0xffE2D3FE),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  controller.jobs[index].gender
                                                      .toString(),
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
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: const Color(0xffE2D3FE),
                                              ),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  controller
                                                      .goToJobDetails(index);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 248, 206, 122),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
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
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
