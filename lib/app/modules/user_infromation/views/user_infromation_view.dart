import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_infromation_controller.dart';

class UserInfromationView extends GetView<UserInfromationController> {
  const UserInfromationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserInfromationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UserInfromationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
