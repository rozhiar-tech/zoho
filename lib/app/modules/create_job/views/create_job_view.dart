import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_job_controller.dart';

class CreateJobView extends GetView<CreateJobController> {
  const CreateJobView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateJobView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreateJobView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
