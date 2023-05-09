import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/confirm_email_controller.dart';

class ConfirmEmailView extends GetView<ConfirmEmailController> {
  const ConfirmEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConfirmEmailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ConfirmEmailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
