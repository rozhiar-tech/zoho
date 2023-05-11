import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          // leading: IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: Icon(
          //     Icons.arrow_back_ios,
          //     color: Colors.black,
          //   ),
          // ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        drawer: Drawer(
          // backgroundColor: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xffF8F8F8),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/splash.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.sunny),
                title: Text('Dark Mode'),
                onTap: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'John Doe',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. Sed vitae nisi eget nunc ultricies aliquet.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }
}
